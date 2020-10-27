<template lang="">
    <div>
      <div>
        Cover Image
        <h1> {{ name }} </h1>
      </div>
        <b-button v-if="" @click="" type="is-info">Add Friend</b-button>
        <write-status v-if="showWriteStatus"/>
        <show-posts pageType="profile" />
    </div>
</template>

<script>
import posts from "./posts";
import StatusWriteBox from "./StatusWriteBox";

export default {
  name: "profile",

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

    // showAddFriend() {
    //   return this.$store.state.user.id !==
    // },
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