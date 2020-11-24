<template>
  <div class="comment-field" @keyup.enter="sendComment">
    <b-field label="Comment" :label-position="'on-border'">
      <b-input v-model="comment" type="text"></b-input>
    </b-field>
  </div>
</template>

<script>
export default {
  name: "Comment-Field",

  data() {
    return {
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

<style>
.comment-field {
  margin-top: 15px;
}
</style>