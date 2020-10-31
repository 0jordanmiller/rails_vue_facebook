<template>
  <div @keyup.enter="sendComment">
    <b-field label="Comment" :label-position="labelPosition">
      <b-input v-model="comment" type="text"></b-input>
    </b-field>
  </div>
</template>

<script>
export default {
  name: "Comment-Field",

  data() {
    return {
      labelPosition: "on-border",
      comment: "",
    };
  },
  methods: {
    sendComment() {
      this.$emit("send-comment", this.comment);
      this.comment = "";
    },
  },
};
</script>


