<template>
  <div id="dashboard-core-bottom">
    <v-container style="padding:15px 20px;">
      <v-row align="center" no-gutters style="width:100%;">
        <v-col cols="12" md="12" style="width:100%;text-align:center;">
          <a
            v-if="this.$store.state.auth.status.loggedIn"
            @click="logout"
            class="bTabHref"
            style="border:1px solid white;padding:0 5px;border-radius:5px;"
          >
            LOGOUt
          </a>
        </v-col>
        <v-col cols="12" md="12" style="padding:0;width:100%;">
          <div
            class="text-body-1 font-weight-light pt-6 pt-md-0 text-center"
            style="width:100%;min-height:20px; display:flex;"
          >
            <p
              style="font-size:13px;margin:auto;color:#06125c;font-weight:bold"
            >
              © Copyright 2021| LPK KPMI
            </p>
          </div>
        </v-col>
      </v-row>
    </v-container>
    <v-snackbar v-model="showResult" :timeout="2000" top>
      {{ result }}
    </v-snackbar>
  </div>
</template>

<script>
export default {
  name: 'DashboardCoreBottom',

  data: () => ({
    isAdmin: false,
    showResult: false,
    result: ''
  }),
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
<style lang="scss" scoped>
#dashboard-core-bottom {
  background-image: -webkit-linear-gradient(bottom, #f9a825, #ffeb3b);
  background-image: linear-gradient(to top, #f9a825, #ffeb3b);
}
</style>
<style lang="sass">
#dashboard-core-bottom
  color: white
  background: #FDD835
  padding: 10px 30px
  border: none
  a
    font-size: .825rem
    font-weight: 500
    text-decoration: none
    text-transform: uppercase

  p
    text-transform: uppercase
    cursor: pointer

  .bTabHref
    color: white

    &:hover
      color: red
      background: white
      text-decoration: underline white
</style>
