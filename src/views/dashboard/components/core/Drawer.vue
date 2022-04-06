<template>
  <v-navigation-drawer
    id="core-navigation-drawer"
    v-model="$store.state.drawer"
    :dark="barColor !== 'rgba(228, 226, 226, 1), rgba(255, 255, 255, 0.7)'"
    left
    :src="barImage"
    fixed
    width="260"
  >
    <template v-slot:img="props">
      <v-img :gradient="`to bottom, ${barColor}`" v-bind="props" />
    </template>

    <v-divider class="mb-1" />

    <v-list dense nav>
      <v-list-item>
        <v-list-item-avatar class="align-self-center" color="white" contain />

        <v-list-item-content>
          <v-list-item-title class="text-h4" v-text="account.title" />
        </v-list-item-content>
      </v-list-item>
    </v-list>

    <v-divider class="mb-2" />

    <v-list expand nav>
      <div />

      <!-- Tab Home -->
      <div>
        <router-link style="text-decoration:none;" to="/">
          <base-item
            :item="{
              title: 'Home',
              icon: 'mdi-home'
            }"
          />
        </router-link>
      </div>

      <!-- Tab Profile -->
      <div>
        <v-list-group :value="false" no-action sub-group color="white">
          <template v-slot:activator>
            <div class="d-flex" style="position:relative; width:100%;">
              <v-list-item-icon>
                <v-icon>mdi-view-dashboard-outline</v-icon>
              </v-list-item-icon>
              <v-list-item-content>
                <v-list-item-title>Profile</v-list-item-title>
              </v-list-item-content>
              <v-list-item-icon style="position:absolute; right:0;">
                <v-icon>mdi-chevron-down</v-icon>
              </v-list-item-icon>
            </div>
          </template>

          <v-list-item
            v-for="(title, i) in profile"
            :key="i"
            link
            style="height:45px;padding:0;"
          >
            <router-link
              class="d-flex justify-center align-center"
              style="text-decoration:none;width:100%;height:100%;padding:0 5px;"
              :to="title.path"
            >
              <v-list-item-title
                v-text="title.name"
                style="padding-left:50px;color:white;"
              ></v-list-item-title>
            </router-link>
          </v-list-item>
        </v-list-group>
      </div>
      <div>
        <v-list-group :value="false" no-action sub-group color="white">
          <template v-slot:activator>
            <div class="d-flex" style="position:relative; width:100%;">
              <v-list-item-icon>
                <v-icon>mdi-text-box-check</v-icon>
              </v-list-item-icon>
              <v-list-item-content>
                <v-list-item-title>Sertifikasi</v-list-item-title>
              </v-list-item-content>
              <v-list-item-icon style="position:absolute; right:0;">
                <v-icon>mdi-chevron-down</v-icon>
              </v-list-item-icon>
            </div>
          </template>

          <v-list-item
            v-for="(title, i) in sertifikasi"
            :key="i"
            link
            style="height:45px;padding:0;"
          >
            <router-link
              class="d-flex justify-center align-center"
              style="text-decoration:none;width:100%;height:100%;padding:0 5px;"
              :to="title.path"
            >
              <v-list-item-title
                v-text="title.name"
                style="padding-left:50px;color:white;"
              ></v-list-item-title>
            </router-link>
          </v-list-item>
        </v-list-group>
      </div>

      <!-- Tab Berita -->
      <div>
        <router-link style="text-decoration:none;" to="/pages/berita">
          <base-item
            :item="{
              title: 'Berita',
              icon: 'mdi-newspaper-variant-outline'
            }"
          />
        </router-link>
      </div>

      <!-- Tab Agenda -->
      <div>
        <router-link style="text-decoration:none;" to="/pages/agenda">
          <base-item
            :item="{
              title: 'Agenda',
              icon: 'mdi-calendar-month-outline'
            }"
          />
        </router-link>
      </div>

      <!-- Tab Galeri -->
      <div>
        <router-link style="text-decoration:none;" to="/pages/gallery">
          <base-item
            :item="{
              title: 'Galleri',
              icon: 'mdi-folder-multiple-image'
            }"
          />
        </router-link>
      </div>

      <!-- tab Kontak kami -->
      <div>
        <router-link style="text-decoration:none;" to="/pages/kontak">
          <base-item
            :item="{
              title: 'Kontak Kami',
              icon: 'mdi-cellphone-message'
            }"
          />
        </router-link>
      </div>

      <div @click="logout" v-if="this.$store.state.auth.status.loggedIn">
        <base-item
          :item="{
            title: 'Logout',
            icon: 'mdi-power'
          }"
        />
      </div>
      <div />
    </v-list>
  </v-navigation-drawer>
</template>

<script>
import { mapState } from 'vuex'

export default {
  name: 'DashboardCoreDrawer',

  props: {},

  data: () => ({
    profile: [
      {
        name: 'Visi Misi',
        path: '/pages/visi-misi'
      },
      {
        name: 'Latar Belakang',
        path: '/pages/latar-belakang'
      },
      {
        name: 'Struktur Organisasi',
        path: '/pages/struktur-organisasi'
      }
    ],
    sertifikasi: [
      {
        name: 'Skema Sertifikasi',
        path: '/pages/skema-sertifikasi'
      },
      {
        name: 'Asesor Kompetensi',
        path: '/pages/asesor'
      },
      {
        name: 'Pemegang Sertifikat',
        path: '/pages/pemegang-sertifikat'
      },
      {
        name: 'Tempat Uji Sertifikasi',
        path: '/pages/tuk'
      }
    ],
    items: [
      {
        icon: 'mdi-view-dashboard',
        title: 'dashboard',
        to: '/'
      },
      {
        title: 'Profile',
        icon: 'mdi-account-box-multiple',
        to: '/pages/profile'
      }
    ]
  }),

  computed: {
    ...mapState(['barColor', 'barImage']),
    computedItems() {
      return this.items.map(this.mapItem)
    },
    account() {
      return {
        avatar: true,
        title: 'Lsp'
      }
    }
  },

  created() {},

  methods: {
    mapItem(item) {
      return {
        ...item,
        children: item.children ? item.children.map(this.mapItem) : undefined,
        title: this.$t(item.title)
      }
    },
    logout() {
      this.$store.dispatch('auth/logout').then(
        () => {
          this.$router.push('/')
        },
        error => {
          this.error = true
          this.result =
            (error.response && error.response.data.status_msg) ||
            error.message ||
            error.toString()
          this.showResult = true
        }
      )
    }
  }
}
</script>

<style lang="sass">
@import '~vuetify/src/styles/tools/_rtl.sass'

#core-navigation-drawer
  .v-list-group__header.v-list-item--active:before
    opacity: .24

  .v-list-item
    &__icon--text,
    &__icon:first-child
      justify-content: center
      text-align: center
      width: 20px

      +ltr()
        margin-right: 24px
        margin-left: 12px !important

      +rtl()
        margin-left: 24px
        margin-right: 12px !important

  .v-list--dense
    .v-list-item
      &__icon--text,
      &__icon:first-child
        margin-top: 10px

  .v-list-group--sub-group
    .v-list-item
      +ltr()
        padding-left: 8px

      +rtl()
        padding-right: 8px

    .v-list-group__header
      +ltr()
        padding-right: 0

      +rtl()
        padding-right: 0

      .v-list-item__icon--text
        margin-top: 19px
        order: 0

      .v-list-group__header__prepend-icon
        order: 2

        +ltr()
          margin-right: 8px

        +rtl()
          margin-left: 8px
</style>
