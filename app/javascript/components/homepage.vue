<template lang="">
<div>
  <div v-if="!signedIn">
    <div class="columns">
      <div class="column is-6">
        <h1>facebook lol</h1>
      </div>
      <div class="column is-6">
        <sign-in />
        <sign-up />
      </div>
    </div>
  </div>

    <div v-if="signedIn">
        <write-status />
        <show-posts postUser='home' />
    </div>
</div>

</template>

<script>
import signin from "./signin";
import posts from "./posts";
import modal from "./modal";
import writestatus from "./writeStatus";

export default {
  name: "home",
  computed: {
    signedIn() {
      return this.$store.state.user;
    },
  },
  components: {
    "sign-in": signin,
    "sign-up": modal,
    "write-status": writestatus,
    "show-posts": posts,
  },
};
</script>