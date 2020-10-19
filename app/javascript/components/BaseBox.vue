<template>
  <div>
    <div v-for="(data, i) in data" :key="data.id" class="box">
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
                <div v-if="true"></div>
                <router-link :to="userProfile(data.user_id)">
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
              <comment-box :index="i" :comments="comments" />

              <p>Likes: {{ likeCount(likes[i]) }}</p>
            </div>
            <write-comment v-on:sendComment="makeComment(data.id, $event)" />
          </div>
        </div>
        <div v-if="addFriend" class="media-right">
          <add-friend :id="data.id" />
        </div>
        <div v-if="isPost">
          <nav class="level is-mobile">
            <div class="level-left">
              <a @click="likeOrUnlike(i, data.id)">
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
            </div>
          </nav>
        </div>
      </article>
    </div>
  </div>
</template>

<script>
import addFriendButton from "./addFriendButton";
import writeCommentField from "./WriteCommentField";
import commentBox from "./CommentBox";
import axios from "../backend";
import Vue from "vue";

export default {
  name: "rectangle-box",
  props: ["data", "likes", "comments", "addFriend", "isPost"],
  components: {
    "add-friend": addFriendButton,
    "write-comment": writeCommentField,
    "comment-box": commentBox,
  },

  methods: {
    userProfile(id) {
      return "/user/" + id;
    },
    likeCount(likes) {
      return likes.length;
    },
    likeOrUnlike(index, post_id) {
      if (this.likedPosts[index]) {
        this.unlikePost(post_id, index);
      } else {
        this.likePost(post_id, index);
      }
    },
    likePost: function (post_id, index) {
      let self = this;
      axios
        .post("/like_post", {
          params: {
            post_id: post_id,
            user_id: this.$store.state.user.id,
          },
        })
        .then((response) => {
          self.likedPosts[index] = true;
        })
        .catch((err) => {
          console.log(err);
        });
    },
    unlikePost: function (post_id, index) {
      let self = this;
      axios
        .delete("/like_post", {
          params: {
            post_id: post_id,
            user_id: this.$store.state.user.id,
          },
        })
        .then((response) => {
          self.likedPosts[index] = false;
        })
        .catch((err) => {
          console.log(err);
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
          },
        })
        .then((response) => {
          console.log(response);
        })
        .catch((err) => {
          console.log(err);
        });
    },
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