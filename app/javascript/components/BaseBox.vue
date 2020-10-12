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
                <router-link :to="userProfile(data.id)">
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
              <p>Likes: {{ likeCount(likes[i]) }}</p>
            </div>
            <write-comment />
          </div>
        </div>
        <div v-if="addFriend" class="media-right">
          <add-friend :id="data.id" />
        </div>

        <div v-if="isPost">
          <nav class="level is-mobile">
            <div class="level-left">
              <a @click="likePost(data.id)">
                <span class="icon is-small">
                  <font-awesome-icon :icon="solid(i)" />
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
import axios from "../backend";

export default {
  name: "rectangle-box",
  props: ["data", "likes", "addFriend", "isPost"],
  components: {
    "add-friend": addFriendButton,
    "write-comment": writeCommentField,
  },

  methods: {
    solid(index) {
      if (this.likedPosts[index] === true) {
        return ["fas", "thumbs-up"];
      } else {
        return ["far", "thumbs-up"];
      }
    },
    userProfile(id) {
      return "/user/" + id;
    },
    likeCount(likes) {
      return likes.length;
    },
    likeOrUnlike() {},
    likePost(post) {
      axios
        .post("/like_post", {
          params: {
            post_id: post,
            user_id: this.$store.state.user.id,
          },
        })
        .then((response) => {
          // console.log(response);
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
        console.log(arr[i]);
      }
      this.likedPosts.push(found);
    },
  },
  watch: {
    likes(n) {
      console.log(n);
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