<template>
  <div class="vBgContainer">
    <v-col class="titleHeaderContent" cols="12"> </v-col>
    <v-container
      id="VisiMisi"
      tag="section"
      :style="
        `width:${
          wWidth < 1225 ? '100%' : '50%'
        };padding: 0 15px;min-height:75vh; position:relative; top:-30px;background:rgba(255,255,255,0.9);`
      "
    >
      <v-row
        align="center"
        no-gutters
        style="font-size:18px;padding:0;margin:0;"
      >
        <v-col
          cols="12"
          class="d-flex"
          style="position:relative; top:-37px;padding:0 20px;"
        >
          <h2 class="hTitle">
            Visi & Misi
          </h2>
        </v-col>
        <v-col cols="12" style="padding:0 20px;" class="d-flex">
          <v-list
            tile
            elevation="0"
            color="transparent"
            subheader
            three-line
            disabled
            :style="
              `padding:15px;width:${
                wWidth < 700 ? '100%' : '70%'
              }min-height:50vh;`
            "
          >
            <v-list-item-group :style="`padding:0;margin:0;`">
              <v-list-item style="min-height:100px;margin-bottom:20px;">
                <template v-slot:default>
                  <v-list-item-content
                    class="d-flex justify-center align-start"
                    style="padding:0;margin:0;cursor:auto;"
                  >
                    <p
                      style="font-family:arial-narrow;font-weight:bold; font-size:21px;margin:0;color:#777;"
                    >
                      VISI
                    </p>
                    <div class="d-flex">
                      <p
                        :style="
                          `font-size:${
                            wWidth > 400 ? '16px' : '4vw'
                          }; font-weight:400;margin:0; color:black;text-align:justify;`
                        "
                      >
                        Menjadi Lembaga Sertifikasi Profesi yang diakui secara
                        nasional maupun internasional dalam memastikan
                        kompetensi tenaga profesional yang terpercaya dan
                        berdaya saing unggul
                      </p>
                    </div>
                  </v-list-item-content>
                </template>
              </v-list-item>

              <v-list-item style="min-height:30vh;margin:0;">
                <template v-slot:default>
                  <v-list-item-content
                    class="d-flex justify-center align-start"
                    style="padding:0;margin:0;cursor:auto;"
                  >
                    <p
                      style="font-family:arial-narrow;font-weight:bold; font-size:21px;margin:0;color:#777;"
                    >
                      MISI
                    </p>
                    <div class="d-flex">
                      <div style="margin-right:10px;">
                        <v-icon>mdi-circle-medium</v-icon>
                      </div>
                      <p
                        :style="
                          `font-size:${
                            wWidth > 400 ? '16px' : '4vw'
                          }; font-weight:400;margin:0; color:black;text-align:justify;`
                        "
                      >
                        Memberikan pelayanan uji kompetensi dengan mengutamakan
                        mutu dan kualitas serta kepuasan pelanggan di Industri
                        Minyak dan Gas Bumi
                      </p>
                    </div>
                    <div class="d-flex">
                      <div style="margin-right:10px;">
                        <v-icon>mdi-circle-medium</v-icon>
                      </div>
                      <p
                        :style="
                          `font-size:${
                            wWidth > 400 ? '16px' : '4vw'
                          }; font-weight:400;margin:0; color:black;text-align:justify;`
                        "
                      >
                        Menjamin bahwa pelayanan sertifikasi yang dilaksanakan
                        telah menerapkan prinsip-prinsip asesmen yang tertelusur
                        dan terukur
                      </p>
                    </div>

                    <div class="d-flex">
                      <div style="margin-right:10px;">
                        <v-icon>mdi-circle-medium</v-icon>
                      </div>
                      <p
                        :style="
                          `font-size:${
                            wWidth > 400 ? '16px' : '4vw'
                          }; font-weight:400;margin:0; color:black;text-align:justify;`
                        "
                      >
                        Menerapkan kebijakan, prosedur dan administrasi
                        sertifikasi sesuai persyaratan sertifikasi yang telah
                        ditetapkan lembaga dengan mengacu pada acuan normatif
                        dan pedoman/aturan-aturan yang berlaku
                      </p>
                    </div>
                  </v-list-item-content>
                </template>
              </v-list-item>
              <v-list-item style="min-height:70px;margin-top:20px;">
                <template v-slot:default>
                  <v-list-item-content
                    class="d-flex justify-center align-start"
                    style="padding:0;margin:0;cursor:auto;"
                  >
                    <p
                      style="font-family:arial-narrow;font-weight:bold; font-size:21px;margin:0;color:#777;"
                    >
                      MOTO
                    </p>
                    <div class="d-flex">
                      <p
                        :style="
                          `font-size:${
                            wWidth > 400 ? '16px' : '4vw'
                          }; font-weight:400;margin:0; color:black;text-align:justify;`
                        "
                      >
                        Terpercaya, Kompeten, Unggul
                      </p>
                    </div>
                  </v-list-item-content>
                </template>
              </v-list-item>
            </v-list-item-group>
          </v-list>
          <!-- <div
            v-if="wWidth > 700"
            :style="
              `margin:0;padding:15px;width:${
                wWidth < 700 ? '0' : '30%'
              };border-left:${
                wWidth > 700 ? '1px solid rgba(0,0,0,0.2)' : 'none'
              };`
            "
          >
            <profile-side-navigation />
          </div> -->
        </v-col>
      </v-row>
    </v-container>
  </div>
</template>

<script>
export default {
  name: 'VisiMisi',
  components: {
    // ProfileSideNavigation: () => import('./sideNav/Side_Nav')
  },
  data() {
    return {
      items: [
        { header: 'Today' },
        {
          avatar: 'https://cdn.vuetifyjs.com/images/lists/1.jpg',
          title: 'Brunch this weekend?',
          subtitle: `<span class="text--primary">Ali Connors</span> &mdash; I'll be in your neighborhood doing errands this weekend. Do you want to hang${'out'}?`
        },
        { divider: true, inset: true },
        {
          avatar: 'https://cdn.vuetifyjs.com/images/lists/2.jpg',
          title: 'Summer BBQ <span class="grey--text text--lighten-1">4</span>',
          subtitle: `<span class="text--primary">to Alex, Scott, Jennifer</span> &mdash; Wish I could come, but I'm out of town this ${'weekend.'}`
        },
        { divider: true, inset: true },
        {
          avatar: 'https://cdn.vuetifyjs.com/images/lists/3.jpg',
          title: 'Oui oui',
          subtitle:
            '<span class="text--primary">Sandra Adams</span> &mdash; Do you have Paris recommendations? Have you ever been?'
        },
        { divider: true, inset: true },
        {
          avatar: 'https://cdn.vuetifyjs.com/images/lists/4.jpg',
          title: 'Birthday gift',
          subtitle:
            '<span class="text--primary">Trevor Hansen</span> &mdash; Have any ideas about what we should get Heidi for her birthday?'
        },
        { divider: true, inset: true },
        {
          avatar: 'https://cdn.vuetifyjs.com/images/lists/5.jpg',
          title: 'Recipe to try',
          subtitle:
            '<span class="text--primary">Britta Holt</span> &mdash; We should eat this: Grate, Squash, Corn, and tomatillo Tacos.'
        }
      ],
      wWidth: window.innerWidth
    }
  },
  mounted() {
    window.scrollTo(0, 0)
    this.$nextTick(() => {
      window.addEventListener('resize', this.onResize)
    })
  },

  beforeDestroy() {
    window.removeEventListener('resize', this.onResize)
  },

  methods: {
    onResize() {
      this.wWidth = window.innerWidth
    }
  }
}
</script>
<style lang="scss" scoped>
.vBgContainer {
  // background: rgba(0, 0, 0, 0.4);
  position: relative;
  // background-image: -webkit-linear-gradient(top, transparent, #06285c);
  // background-image: linear-gradient(to bottom, transparent, #06285c);
  background-image: url('../../assets/Oil-Rig.jpg');
  background-size: cover;
  background-repeat: no-repeat;
}
.titleHeaderContent {
  border-bottom: 6px solid red;
  height: 80px;
  // background: #06125c;
  background-image: -webkit-linear-gradient(top, transparent, #06125c);
  background-image: linear-gradient(to bottom, transparent, #06125c);
}
.hTitle {
  font-family: arial-narrow;
  letter-spacing: 2px;
  color: white;
  border-bottom: 7px solid #06124e;
  padding: 10px 7px;
  text-shadow: -2px 2px 10px black;
}
</style>
