<template lang="">
<div>
    <div v-if="!signedIn">
        <signin />
    </div>
    <div v-if="signedIn">
        signed in
    </div>
</div>

</template>

<script>
import signin from "./signin";

export default {
  name: "home",
  computed: {
    signedIn() {
      return this.$store.state.user;
    },
  },
  components: {
    signin,
  },
};
</script>