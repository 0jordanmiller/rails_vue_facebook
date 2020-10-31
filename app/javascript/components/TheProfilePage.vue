<template lang="">
    <div>
      <div>
        Cover Image
        <h1> {{ name }} </h1>
      </div>
        <b-button v-if="" @click="" type="is-info">Add Friend</b-button>
        <show-posts pageType="profile" />
    </div>
</template>

<script>
import posts from "./AppPosts";
import StatusWriteBox from "./StatusWriteBox";

export default {
  name: "Profile",

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
    "write-status": StatusWriteBox,
    "show-posts": posts,
  },
  data() {
    return {
      name: this.$store.state.user.name,
    };
  },
};
</script>