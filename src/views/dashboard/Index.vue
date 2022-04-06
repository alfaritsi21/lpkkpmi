<template>
  <v-app>
    <DashboardCoreAppBar />

    <DashboardCoreDrawer />

    <DashboardCoreView />
  </v-app>
</template>

<script>
export default {
  name: 'DashboardIndex',

  components: {
    DashboardCoreAppBar: () => import('./components/core/AppBar'),
    DashboardCoreDrawer: () => import('./components/core/Drawer'),
    DashboardCoreView: () => import('./components/core/View')
  },

  data: () => ({
    // expandOnHover: false
  }),
  // watch: {
  //   '$store.state.auth.status.loggedIn'() {
  //     if (localStorage.getItem('user') === null) {
  //       this.$store.state.auth.status.loggedIn = false
  //       this.$router.push('/')
  //     }
  //   }
  // },
  created() {},
  methods: {
    logout() {
      this.$store.dispatch('auth/logout').then(
        () => {
          this.result = 'Logout Success'
          this.showResult = true
        },
        error => {
          console.log(error)
          this.result = 'Logout Failed'
          this.showResult = true
        }
      )
    }
  }
}
</script>
<style scoped></style>
