<template>
  <div>
    <ul>
      <li v-for="post in posts" :key="post.id">{{post.post}}</li>
    </ul>
  </div>
</template>

<script>
import axios from "../backend";

export default {
  name: "Posts",
  data: function () {
    return {
      posts: [],
    };
  },
  created: function () {
    this.showPosts();
  },
  methods: {
    showPosts: function () {
      axios
        .get("/getposts")
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
