<template>
  <div>
    <write-status
      @update-page="showPosts"
      v-if="showWriteStatus || pageType === 'home'"
    />
    <f-posts
      @update-page="showPosts"
      :data="data"
      style="clear: both; padding-top: 10px"
    />
  </div>
</template>

<script>
import axios from "../backend";
import StatusBox from "./StatusBox";
import WriteStatusBox from "./StatusWriteBox";

export default {
  name: "App-Posts",
  props: ["pageType"],
  components: {
    "f-posts": StatusBox,
    "write-status": WriteStatusBox,
  },
  data: function () {
    return {
      data: []
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
          this.data = response.data
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
