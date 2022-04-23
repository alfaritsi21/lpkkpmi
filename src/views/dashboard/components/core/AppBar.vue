<template>
  <!-- <v-app-bar id="app-bar" absolute flat height="120px"> -->
  <nav class="appBarSticky">
    <v-container fluid id="nBar" class="nContainer">
      <v-row no-gutters>
        <v-col cols="9" md="3" id="n-col-1">
          <div class="d-flex" style="">
            <router-link style="color:black;text-decoration:none;" to="/">
              <div>
                <v-img
                  id="logoImg"
                  class="imgMax rounded-circle"
                  alt="lsp-pmi"
                  contain
                  src="../../../../../public/LSPPMI_Logo.png"
                  transition="scale-transition"
                />
                <div id="logoTitle" class="logoTitleMax">
                  <!-- <p style="margin:0;font-weight:900; ">LPK KPMI</p> -->
                  <!-- <p style="margin:0;font-weight:900; ">INDONESIA</p> -->
                </div>
              </div>
            </router-link>
            <div class="navTitle">
              <!-- <v-toolbar-title
                id="nTitle"
                class="tMax tMobile"
                v-text="'LPK - KPMI'"
              /> -->
              <p class="p-title">
                Lembaga Pelatihan Kerja Kompetensi
                <span style="color:transparent;"
                  >Lorem ipsum dolor sit amet.</span
                >
              </p>
              <!-- <p class="p">
                Kompetensi
                <span style="color:transparent;"
                  >Lorem ipsum dolor sit amet.</span
                >
              </p> -->
              <p class="p-title">
                Profesional Migas Indonesia
                <span style="color:transparent;"
                  >Lorem ipsum dolor sit amet.</span
                >
              </p>
            </div>
          </div>
        </v-col>

        <v-col cols="9" md="3" id="n-col-1-mobile">
          <div class="d-flex ">
            <div>
              <v-img
                id="logoImg"
                class="imgMaxMobile rounded-circle"
                alt="lsp-pmi"
                contain
                src="../../../../../public/LSPPMI_Logo.png"
                transition="scale-transition"
              />
            </div>
            <div class="navTitleMobile">
              <v-toolbar-title
                id="nTitleMobile"
                class="tMaxMobile"
                v-text="'LPK - KPMI'"
              />
            </div>
          </div>
        </v-col>

        <v-col cols="3" md="9" id="n-col-2">
          <div class="mobileAppBar" style="text-align:right;">
            <v-menu
              v-for="(item, index) in bar"
              :key="index"
              bottom
              right
              offset-y
              transition="slide-y-transition"
            >
              <template v-slot:activator="{ attrs, on }">
                <v-btn
                  :small="scrlY > 0"
                  :style="
                    `${
                      index === 0 ? 'background:#06125c' : ''
                    }; margin:0; transition:0.4s;border:1px solid black; min-width:60px padding:0; `
                  "
                  class="ml-2"
                  text
                  v-bind="attrs"
                  v-on="on"
                  color="#06125c"
                  @click="router(item.path, index)"
                >
                  <v-toolbar-title
                    :style="
                      `color:${index === 0 ? 'white' : '#06125c'}; font-size:${
                        scrlY > 50 ? '11px' : '12px'
                      };transition:0.4s;font-weight:500; width:100%;`
                    "
                    >{{ item.tab }}
                    <v-icon
                      :small="scrlY > 50 ? true : false"
                      :style="
                        `position:absolute; top:0; right: ${
                          scrlY > 50 ? '-14px' : '-22px'
                        };`
                      "
                      v-if="index === 1 || index === 2 || index === 3"
                      >mdi-menu-down</v-icon
                    ></v-toolbar-title
                  >
                </v-btn>
                <!-- </v-hover> -->
                <!-- </router-link> -->
              </template>

              <v-list
                v-if="index === 1 || index === 2 || index === 3"
                style="background:#06125c;"
              >
                <v-list-item
                  v-for="(n, i) in item.menu"
                  :key="i"
                  style="height:40px; min-width:220px;padding:0;"
                >
                  <v-tab
                    style="font-size:12px; display:flex; justify-content:flex-start; width:100%;height:100%;background:white;"
                  >
                    <router-link
                      :to="n.path"
                      style="width:100%;height:100%; display:flex; justify-content:flex-start; align-items:center; text-align:left; color:black; text-decoration:none;"
                    >
                      {{ n.tab }}
                    </router-link>
                  </v-tab>
                </v-list-item>
              </v-list>
            </v-menu>
          </div>
        </v-col>

        <v-col cols="3" md="9" id="n-col-2-mobile">
          <v-spacer />
          <v-btn
            class="mobileAppBarDrawer mr-3"
            elevation="1"
            fab
            color="#06125c"
            x-small
            @click="drawer"
          >
            <v-icon v-if="value">
              mdi-view-quilt
            </v-icon>

            <v-icon v-else>
              mdi-dots-vertical
            </v-icon>
          </v-btn>
        </v-col>
      </v-row>
    </v-container>
  </nav>
  <!-- </v-app-bar> -->
</template>

<script>
import { mapMutations } from 'vuex'

export default {
  name: 'DashboardCoreAppBar',
  components: {},

  props: {
    value: {
      type: Boolean,
      default: false
    }
  },

  data: () => ({
    bar: [
      {
        tab: 'Home',
        path: '/',
        menu: [
          {
            tab: '',
            path: ''
          }
        ]
      },
      {
        tab: 'Profile',
        path: '',
        menu: [
          {
            tab: 'Visi Misi',
            path: '/pages/visi-misi'
          },
          {
            tab: 'Latar Belakang',
            path: '/pages/latar-belakang'
          },
          {
            tab: 'Struktur Organisasi',
            path: '/pages/struktur-organisasi'
          }
        ]
      },
      {
        tab: 'Program',
        path: '',
        menu: [
          {
            tab: 'Pelatihan',
            path: '/pages/pelatihan'
          },
          {
            tab: 'Webinar',
            path: '/pages/webinar'
          },
          {
            tab: 'Workshop',
            path: '/pages/workshop'
          },
          {
            tab: 'Bimbingan Teknis',
            path: '/pages/bimbingan-teknis'
          }
        ]
      },
      {
        tab: 'Media & Informasi',
        path: '',
        menu: [
          {
            tab: 'Berita',
            path: '/pages/berita'
          },
          {
            tab: 'Gallery',
            path: '/pages/gallery'
          },
          {
            tab: 'Dokumentasi',
            path: '/pages/dokumentasi'
          }
        ]
      },
      {
        tab: 'Kontak Kami',
        path: '/pages/kontak',
        menu: [
          {
            tab: '',
            path: ''
          }
        ]
      }
      // {
      //   tab: 'Gallery',
      //   path: '/pages/gallery',
      //   menu: [
      //     {
      //       tab: '',
      //       path: ''
      //     }
      //   ]
      // },
      // {
      //   tab: 'Kontak Kami',
      //   path: '/pages/kontak',
      //   menu: [
      //     {
      //       tab: '',
      //       path: ''
      //     }
      //   ]
      // }
    ],
    scrlY: null
  }),

  computed: {
    // ...mapState(['drawer'])
  },
  // created() {
  //   window.addEventListener('scroll', this.scrollUp(1))
  // },

  mounted() {
    window.addEventListener('scroll', this.updateScroll)
  },
  destroy() {
    window.removeEventListener('scroll', this.updateScroll)
  },
  methods: {
    ...mapMutations({
      setDrawer: 'SET_DRAWER'
    }),
    router(path, index) {
      // if (index === 0 || index === 3 || index === 4) {
      //   if (this.$route.fullPath !== path) {
      //     this.$router.push(path)
      //   }
      // }
      if (index === 0 || index === 4) {
        if (this.$route.fullPath !== path) {
          this.$router.push(path)
        }
      }
    },
    updateScroll() {
      this.scrlY = window.scrollY
      const img = document.getElementById('logoImg')
      const t = document.getElementById('logoTitle')
      const nCol1 = document.getElementById('n-col-1')
      const nCol2 = document.getElementById('n-col-2')
      const nTitle = document.getElementById('nTitle')
      const nP = document
        .getElementsByClassName('navTitle')[0]
        .querySelectorAll('p')

      if (window.scrollY > 0) {
        nCol1.style.top = '35px'
        nCol2.style.top = '30px'
        img.classList.remove('imgMax')
        img.classList.add('imgMin')
        t.classList.remove('logoTitleMax')
        t.classList.add('logoTitleMin')
        nTitle.classList.remove('tMax')
        for (let i = 0; i < nP.length; i++) {
          nP[i].style.fontSize = 0
        }
      } else {
        nCol1.style.top = 0
        nCol2.style.top = '20px'
        img.classList.remove('imgMin')
        img.classList.add('imgMax')
        t.classList.remove('logoTitleMin')
        t.classList.add('logoTitleMax')
        nTitle.classList.add('tMax')
        for (let i = 0; i < nP.length; i++) {
          nP[i].style.fontSize = '14px'
        }
      }
    },
    drawer() {
      let a = null
      if (this.$store.state.drawer) {
        a = false
      } else {
        a = true
      }

      this.setDrawer(a)
    },
    changePage(val) {
      if (val === 1) {
        this.$router.push('/pages/struktur_organisasi')
      }
    }
  }
}
</script>
<style lang="scss" scoped>
.appBarSticky {
  z-index: 10;
  background: white;
  position: sticky;
  top: -60px;
}
.nContainer {
  width: 100%;
  padding: 0 15px;
  height: 120px;
  display: flex;
  position: sticky;
  // top: -60px;
}
#n-col-1 {
  margin: auto;
  position: relative;
  transition: 0.4s;
}
#n-col-1-mobile {
  display: none;
}
#n-col-2 {
  margin: auto;
  position: relative;
  transition: 0.4s;
  top: 20px;
}
#n-col-2-mobile {
  display: none;
}
.imgMax {
  margin-top: -5px;
  height: 60px;
  width: 60px;
  transition: 0.5s;
}
.imgMin {
  height: 40px;
  width: 40px;
  transition: 0.5s;
}
.logoTitleMax {
  font-size: 6px;
  // font-family: 'Arial Narrow';
  text-align: center;
  line-height: 8px;
  position: relative;
  left: -5px;
}
.logoTitleMin {
  font-size: 6px;
  // font-family: 'Arial Narrow';
  text-align: center;
  line-height: 6px;
  position: relative;
  left: -5px;
}

.navTitle {
  margin-left: 3px;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  width: 231px;
  line-height: 10px;
  .p {
    margin-top: 2px;
    text-align: justify;
    letter-spacing: 1px;
    margin: 0;
    // font-size: 12px;
    transition: 0.5s;
  }
  .p-title {
    padding-top: 4px;
    text-align: left;
    // letter-spacing: 1px;
    margin: 0;
    font-size: 11px;
    font-weight: 500;
    transition: 0.5s;
    }
}
#nTitle {
  font-family: 'Poppins', sans-serif;
  font-weight: bold;
  transition: 0.5s;
  margin: 7px 0 0 0;
  font-size: 14px;
  position: relative;
  top: 5px;
  left: -15px;
}
.tMax {
  padding: 0 !important;
  left: 0 !important;
  font-size: 16px !important;
  letter-spacing: 0.3px;
  top: 0 !important;
  margin: 0 !important;
}
@media (min-width: 960px) {
  .mobileAppBarDrawer {
    display: none;
  }
}
@media (max-width: 960px) {
  .mobileAppBar {
    display: none;
  }

  .appBarSticky {
    z-index: 10;
    background: white;
    position: sticky;
    top: 0;
  }
  .nContainer {
    width: 100%;
    padding: 0;
    height: 60px;
    display: flex;
  }

  #n-col-1 {
    display: none;
  }
  #n-col-1-mobile {
    display: flex;
    align-items: center;

    .imgMaxMobile {
      height: 40px;
      width: 40px;
    }

    #nTitleMobile {
      font-family: 'Poppins', sans-serif;
      font-weight: bold;
      transition: 0.5s;
      margin: 7px 0 0 0;
      font-size: 12px;
      position: relative;
      top: 3px;
    }
    // .tMaxMobile {
    //   font-size: 16px !important;
    //   top: 0 !important;
    //   margin: 0 !important;
    // }

    .navTitleMobile {
      display: flex;
      flex-direction: column;
      .p {
        letter-spacing: 2px;
        margin: 0;
        font-size: 0;
      }
    }
  }

  #n-col-2 {
    display: none;
  }

  #n-col-2-mobile {
    display: flex;
    margin: auto;
    position: relative;
    top: 0;
  }
}
</style>
