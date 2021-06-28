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
                <router-link :to="userProfile(data.user_id)">
                  {{ filterName(data.user_id) }}
                </router-link>

              </strong>
              <br />
              <small>{{ data.created_at }}</small>
              <br />
              {{ data.post }}
            </p>
          </div>

          <div>
            <div>
              <p>
                <a @click="thumbsUp(i, data.id, data.user_id)">
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
        <nav v-if="signedIn === data.user_id" class="level is-mobile">
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
import writeCommentField from "./WriteCommentField";
import commentBox from "./CommentBox";
import dropdown from "./PostDropdown";
import axios from "../backend";
import Vue from "vue";
import sendNotificationMixin from "../mixins/sendNotificationMixin";

export default {
  name: "Status-Box",
  props: ["data", "likes", "comments", "addFriend", "names"],
  components: {
    "write-comment": writeCommentField,
    "comment-box": commentBox,
    "drop-down": dropdown,
  },
  mixins: [sendNotificationMixin],
  data() {
    return {
      iconSet: ["fas", "thumbs-up"],
      likedPosts: [],
    };
  },
  computed: {
    signedIn() {
      return this.$store.state.user.id;
    },
  },
  methods: {
    filterName(id) {
      return this.names[id];
    },
    likedOrNot(arr) {
      let found = false;
      for (let i = 0; i < arr.length; i++) {
        if (arr[i].user_id === this.$store.state.user.id) {
          found = true;
        }
      }
      this.likedPosts.push(found);
    },
    userProfile(id) {
      return "/user/" + id;
    },
    likeCount(likes) {
      return likes.length;
    },
    thumbsUp(index, post_id, user_id) {
      if (this.likedPosts[index]) {
        this.likeOrUnlike(post_id, index, "delete", false);
      } else {
        this.likeOrUnlike(post_id, index, "post", true, user_id);
      }
    },
    likeOrUnlike(post_id, index, method, like, user_id) {
      axios({
        method: method,
        url: "/like_post",
        params: {
          post_id: post_id,
          user_id: this.$store.state.user.id,
        },
      }).then((response) => {
        if (method === "post") {
          this.notify("like", this.$store.state.user.name, user_id, post_id);
        }
        this.likedPosts[index] = like;
        this.updatePage();
      });
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

  watch: {
    likes(n) {
      n.forEach((element) => {
        this.likedOrNot(element);
      });
    },
  },
  created() {},
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