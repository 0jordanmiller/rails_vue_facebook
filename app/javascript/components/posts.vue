<template>
  <div>
    <f-post :data="posts" />
  </div>
</template>

<script>
import axios from "../backend";
import BaseBox from "./BaseBox";

export default {
  name: "show-posts",
  props: ["pageType"],
  components: {
    "f-post": BaseBox,
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
            page_type: this.pageType,
            user_id: this.$store.state.user.id,
          },
        })
        .then((response) => {
          this.posts = response.data;
          console.log(response.data);
        })
        .catch((error) => {
          console.log(error);
        });
    },
  },
};
</script>
