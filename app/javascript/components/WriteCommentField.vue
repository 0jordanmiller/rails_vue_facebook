<template>
  <div @keyup.enter="sendComment">
    <b-field label="Comment" :label-position="labelPosition">
      <b-input v-model="comment" type="text"></b-input>
    </b-field>
  </div>
</template>

<script>
export default {
  name: "write-comment",
  methods: {
    sendComment() {
      console.log("hello");
      this.$emit("sendComment", this.comment);
    },
  },
  data() {
    return {
      labelPosition: "on-border",
      comment: "",
    };
  },
};
</script>


