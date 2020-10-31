<template>
  <div>
    <div class="box" v-for="(data, i) in data" :key="data.id">
      <article class="media">
        <div class="media-left">
          <figure class="image is-64x64">
            <img
              src="https://bulma.io/images/placeholders/128x128.png"
              alt="Image"
            />
          </figure>
        </div>
        <div class="media-content">
          <div class="content">
            <p>
              <strong>
                <!-- add conditional links and methods -->
                <router-link v-if="isPost" :to="userProfile(data.user_id)">
                  {{ data.name }}
                </router-link>
                <router-link v-else :to="userProfile(data.id)">
                  {{ data.name }}
                </router-link>
              </strong>
              <br />
              <small>{{ data.created_at }}</small>
              <br />
              {{ data.post }}
            </p>
          </div>

          <div v-if="isPost">
            <div>
              <p>
                <a @click="thumbsUp(i, data.id)">
                  <span class="icon is-small">
                    <font-awesome-icon
                      :icon="
                        likedPosts[i]
                          ? ['fas', 'thumbs-up']
                          : ['far', 'thumbs-up']
                      "
                    />
                  </span>
                </a>
                {{ likeCount(likes[i]) }}
              </p>

              <comment-box :index="i" :comments="comments" />
            </div>
            <write-comment @send-comment="makeComment(data.id, $event)" />
          </div>
        </div>
        <div v-if="addFriend" class="media-right">
          <add-friend :id="data.id" />
        </div>
        <nav v-if="isPost && signedIn === data.user_id" class="level is-mobile">
          <div class="level-left">
            <drop-down
              :id="data.id"
              postOrComment="posts"
              @update-page="updatePage"
            />
          </div>
        </nav>
      </article>
    </div>
  </div>
</template>

<script>
import addFriendButton from "./addFriendButton";
import writeCommentField from "./WriteCommentField";
import commentBox from "./CommentBox";
import dropdown from "./PostDropdown";
import axios from "../backend";
import Vue from "vue";

export default {
  name: "Base-Box",
  props: ["data", "likes", "comments", "addFriend", "isPost"],
  components: {
    "add-friend": addFriendButton,
    "write-comment": writeCommentField,
    "comment-box": commentBox,
    "drop-down": dropdown,
  },
  computed: {
    userId() {},
  },
  watch: {
    likes(n) {
      n.forEach((element) => {
        this.likedOrNot(element);
      });
    },
  },
  data() {
    return {
      iconSet: ["fas", "thumbs-up"],
      likedPosts: [],
    };
  },
  methods: {
    test() {
      console.log("tested");
    },
    userProfile(id) {
      return "/user/" + id;
    },
    likeCount(likes) {
      return likes.length;
    },
    thumbsUp(index, post_id) {
      if (this.likedPosts[index]) {
        this.likeOrUnlike(post_id, index, "delete", false);
      } else {
        this.likeOrUnlike(post_id, index, "post", true);
      }
    },
    likeOrUnlike(post_id, index, method, like) {
      axios({
        method: method,
        url: "/like_post",
        params: {
          post_id: post_id,
          user_id: this.$store.state.user.id,
        },
      }).then((response) => {
        this.likedPosts[index] = like;
        this.updatePage();
      });
    },
    likedOrNot(arr) {
      let found = false;
      let i;
      for (i = 0; i < arr.length; i++) {
        if (arr[i].user_id === this.$store.state.user.id) {
          found = true;
        }
      }
      this.likedPosts.push(found);
    },
    makeComment(post_id, comment) {
      console.log(post_id, comment);
      axios
        .post("/comments", {
          params: {
            post_id: post_id,
            user_id: this.$store.state.user.id,
            comment: comment,
            commenter: this.$store.state.user.name,
          },
        })
        .then((response) => {
          this.updatePage();
        })
        .catch((err) => {
          console.log(err);
        });
    },
    updatePage() {
      this.$emit("update-page");
    },
  },
  computed: {
    signedIn() {
      return this.$store.state.user.id;
    },
  },
};
</script>

<style lang="scss">
p {
  font-size: 20px;
}
.box {
  max-width: 900px;
  margin: auto;
}
</style>