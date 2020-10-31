<template>
  <div>
    <write-status
      @update-page="showPosts"
      v-if="showWriteStatus || pageType === 'home'"
    />
    <f-post
      @update-page="showPosts"
      :data="posts"
      :likes="likes"
      :comments="comments"
      :isPost="true"
    />
  </div>
</template>

<script>
import axios from "../backend";
import BaseBox from "./BaseBox";
import WriteStatusBox from "./StatusWriteBox";

export default {
  name: "show-posts",
  props: ["pageType"],
  components: {
    "f-post": BaseBox,
    "write-status": WriteStatusBox,
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
      console.log("posts updated");
      axios
        .get("/posts", {
          params: {
            page_type: this.pageType,
            user_id: this.$route.params.id ?? this.$store.state.user.id,
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
  computed: {
    showWriteStatus() {
      return this.$store.state.user.id === parseInt(this.$route.params.id);
    },
  },
};
</script>
