<template>
  <div>
    <f-friends :data="friends" />
  </div>
</template>


<script>
import axios from "../backend";
import BaseBox from "./BaseBox";

export default {
  name: "TheFriendList",
  components: {
    "f-friends": BaseBox,
  },
  data() {
    return {
      friends: [],
    };
  },
  created() {
    this.getFriends();
  },
  methods: {
    getFriends() {
      axios
        .get("/friends", {
          params: { user_id: this.$store.state.user.id },
        })
        .then((response) => {
          console.log(response);
          this.friends = response.data;
        });
    },
  },
};
</script>