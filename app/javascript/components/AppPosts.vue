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
      :names="names"
      :isPost="true"
      style="clear: both; padding-top: 10px"
    />
  </div>
</template>

<script>
import axios from "../backend";
import BaseBox from "./BaseBox";
import WriteStatusBox from "./StatusWriteBox";

export default {
  name: "App-Posts",
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
      names: "",
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
            user_id: this.$route.params.id ?? this.$store.state.user.id,
          },
        })
        .then((response) => {
          console.log(response);
          this.posts = response.data.posts;
          this.likes = response.data.likes;
          this.comments = response.data.comments;
          this.names = response.data.names;
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
