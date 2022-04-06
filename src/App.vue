<template>
  <router-view />
</template>

<script>
// import { mapActions } from 'vuex'
export default {
  name: 'App',
  created() {
    // this.interceptorRequest()
    // this.interceptorResponse()
    this.$store.dispatch('auth/interceptorRequest')
    this.$store.dispatch('auth/interceptorResponse')
  },
  methods: {
    // ...mapActions(['interceptorRequest', 'interceptorResponse'])
  }
}
</script>
<style scoped></style>
