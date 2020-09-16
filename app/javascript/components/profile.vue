<template lang="">
    <div>
        <write-status v-if="showWriteStatus"/>
        <show-posts :postUser="userId" />
    </div>
</template>

<script>
import posts from "./posts";
import writestatus from "./writeStatus";

export default {
  name: "profile",
  created: function () {
    console.log(typeof this.$store.state.user.id);
    console.log(typeof this.$route.params.id);
  },
  computed: {
    showWriteStatus() {
      return this.$store.state.user.id === parseInt(this.$route.params.id);
    },
    signedIn() {
      return this.$store.state.user;
    },
    userId() {
      return this.$store.state.user.id;
    },
  },
  components: {
    "write-status": writestatus,
    "show-posts": posts,
  },
};
</script>