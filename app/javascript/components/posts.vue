<template>
  <div>
    <f-post v-bind:posts="posts" />
  </div>
</template>

<script>
import axios from "../backend";
import post from "./post";

export default {
  name: "show-posts",
  props: ["postUser"],
  components: {
    "f-post": post,
  },
  data: function () {
    return {
      posts: [],
      show: true,
    };
  },
  created: function () {
    this.showPosts();
  },
  watch: {
    $route(to, from) {
      this.showPosts();
    },
  },
  methods: {
    showPosts: function () {
      axios
        .get("/posts", {
          params: {
            user_id: this.postUser,
          },
        })
        .then((response) => {
          this.posts = response.data;
        })
        .catch((error) => {
          console.log(error);
        });
    },
  },
};
</script>
