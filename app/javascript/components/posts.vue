<template>
  <div>
    <f-post :data="posts" :likes="likes" :comments="comments" :isPost="true" />
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
      likes: [],
      comments: [],
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
            user_id: this.$store.state.user.id ?? this.$route.params.id,
          },
        })
        .then((response) => {
          this.posts = response.data[0];
          this.likes = response.data[1];
          this.comments = response.data[2];
        })
        .catch((error) => {
          console.log(error);
        });
    },
  },
};
</script>
