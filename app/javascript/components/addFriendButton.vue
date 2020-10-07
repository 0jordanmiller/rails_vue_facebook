<template>
  <div>
    <b-button type="is-primary" @click="addFriend(id)">Add Friend</b-button>
  </div>
</template>

<script>
import axios from "../backend";
export default {
  name: "addFriendButton",
  props: ["id"],
  methods: {
    addFriend(friend) {
      axios
        .post("/friend_requests", {
          friend_request: {
            sender: this.$store.state.user.id,
            receiver: friend,
          },
        })
        .then((response) => {
          console.log(response);
        });
    },
  },
};
</script>