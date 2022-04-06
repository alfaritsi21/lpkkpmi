<template>
  <v-app id="login">
    <v-container fluid>
      <v-row align="center" justify="center">
        <v-col cols="12" sm="8" md="4" lg="3">
          <v-card
            class="elevation-4 pa-4"
            style="border:1px solid rgba(0,0,0,0.2);"
          >
            <v-card-text>
              <div class="layout column align-center">
                <v-img
                  src="/LSPPMI_Logo.jpeg"
                  alt="Vue Material Admin"
                  width="100"
                />
                <!-- <h3 class="flex my-4 primary--text">
                  LSP PROMIGAS INDONESIA
                </h3> -->
                <h3 class="flex my-6 primary--text" style="letter-spacing:2px; font-weight:900;">
                  LOGIN
                </h3>
              </div>
              <v-form sty>
                <v-text-field
                  v-model="user.username"
                  append-icon="mdi-account"
                  name="login"
                  label="Login"
                  type="text"
                  :error="error"
                  :rules="[rules.required]"
                />
                <v-text-field
                  id="password"
                  v-model="user.password"
                  :type="hidePassword ? 'password' : 'text'"
                  :append-icon="
                    hidePassword ? 'mdi-account-key' : 'mdi-account-off'
                  "
                  name="password"
                  label="Password"
                  :rules="[rules.required]"
                  :error="error"
                  @click:append="hidePassword = !hidePassword"
                  @keyup.enter="login"
                />
              </v-form>
            </v-card-text>
            <v-card-actions>
              <v-spacer />
              <v-btn block color="primary" :loading="loading" @click="login">
                Login
              </v-btn>
            </v-card-actions>
          </v-card>
        </v-col>
      </v-row>
    </v-container>
    <v-snackbar v-model="showResult" :timeout="2000" top>
      {{ result }}
    </v-snackbar>
  </v-app>
</template>

<script>
import User from '../models/user'
export default {
  data() {
    return {
      loading: false,
      // user: new User('peter.susanto@sanqua.co.id', 'P455uu0rd^^ok'),
      user: new User('', ''),
      hidePassword: true,
      error: false,
      showResult: false,
      result: '',
      rules: {
        required: value => !!value || 'Required.'
      }
    }
  },
  mounted() {
    window.scrollTo(0, 0)
  },

  created() {
    // if (this.$store.state.auth.status.loggedIn) {
    //   this.logout()
    // }
  },

  methods: {
    login() {
      if (!this.user.username || !this.user.password) {
        this.result = 'Username and password can not be empty'
        this.showResult = true
        return
      }

      this.$store.dispatch('auth/login', this.user).then(
        () => {
          this.$router.push('/')
        },
        error => {
          this.error = true
          this.result =
            (error.response && error.response.data.msg) ||
            error.message ||
            error.toString()
          this.showResult = true
        }
      )
    }

    // logout() {
    //   this.$store.dispatch('auth/logout').then(
    //     () => {
    //       this.$router.push('/login')
    //     },
    //     error => {
    //       console.log(error)
    //       this.error = true
    //       this.result =
    //         (error.response && error.response.data.msg) ||
    //         error.message ||
    //         error.toString()
    //       this.showResult = true
    //       console.log(this.result)
    //     }
    //   )
    // }
  }
}
</script>

<style></style>
