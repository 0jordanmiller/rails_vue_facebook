<template lang="">
<div>
  <div v-if="!signedIn">
    <div class="columns">
      <div class="column is-6">
        <h1>facebook lol</h1>
      </div>
      <div class="column is-6">
        <sign-in />
        <signup-modal buttonText="Create New Account" >
          <div slot='content'>
            <signup-content v-on:close="closeModal"/>
          </div>
        </signup-modal>
      </div>
    </div>
  </div>

    <div v-if="signedIn">
        <show-posts pageType='home' />
    </div>
</div>

</template>

<script>
import signin from "./signin";
import posts from "./AppPosts";
import modal from "./modal";
import signup from "./signup";

export default {
  name: "home",
  computed: {
    signedIn() {
      return this.$store.state.user;
    },
  },
  components: {
    "sign-in": signin,
    "signup-modal": modal,
    "show-posts": posts,
    "signup-content": signup,
  },
  methods: {
    closeModal() {
      console.log("abc");
      this.isComponentModalActive = false;
    },
  },
};
</script>