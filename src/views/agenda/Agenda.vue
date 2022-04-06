<template>
  <div class="vBgContainer">
    <v-col class="titleHeaderContent" cols="12"> </v-col>
    <v-container
      id="Agenda"
      tag="section"
      style="padding: 0 15px;min-height:75vh; position:relative; top:-30px;background:rgba(255,255,255,0.9);"
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
            Agenda LSP
          </h2>
        </v-col>
        <v-col cols="12" class="d-flex">
          <v-row>
            <v-col cols="8" style="font-family: 'Arial Narrow';">
              <div
                style="background:grey;height:400px;"
                class="newsMainImage d-flex justify-center align-center"
              ></div>
              <div style="margin-bottom:10px ">
                <p style="0; font-size:32px; font-weight:600;color:#06125c;">
                  Lorem ipsum dolor, sit amet consectetur adipisicing elit.
                  Aliquid id placeat, blanditiis quasi fuga esse!
                  {{ $route.params.id }}
                </p>
              </div>
              <div style="font-size:12px; font-weight:bold;margin-bottom:20px;">
                <div class="d-flex justify-start align-center">
                  <div
                    class="d-flex justify-start align-center"
                    style="margin-right:20px;"
                  >
                    <v-icon style="margin-right:5px;">mdi-calendar</v-icon>
                    <p style="margin:0;">Rabu, 25 Agu 2021 21:32 WIB</p>
                  </div>
                  <div
                    class="d-flex justify-start align-center"
                    style="margin-right:20px;"
                  >
                    <v-icon style="margin-right:5px;">mdi-account-edit</v-icon>
                    <p style="margin:0;">Muhammad Rizki Mulya</p>
                  </div>
                  <div v-if="$store.state.auth.status.loggedIn">
                    <router-link
                      style="text-decoration:none;"
                      :to="`/pages/form-agenda/${$route.params.id}`"
                    >
                      <v-hover v-slot="{ hover }">
                        <v-card
                          :elevation="hover ? '4' : '2'"
                          :style="
                            `color:${
                              hover ? 'blue' : 'black'
                            };margin:0; padding:0 3px;cursor:pointer;border:1px solid rgba(0,0,0,0.1)`
                          "
                          class="d-flex justify-start align-center"
                        >
                          <v-icon
                            :color="hover ? 'blue' : 'black'"
                            small
                            style="margin-right:5px;"
                            >mdi-pencil</v-icon
                          >
                          <p style="margin:0;">Edit Artikel</p>
                        </v-card>
                      </v-hover></router-link
                    >
                  </div>
                </div>

                <hr class="hrNews" />
              </div>
              <div
                style=" min-height:40vh;font-family:'Poppins';font-size:16px; text-align:justify;"
              >
                <div v-html="text"></div>
              </div>
            </v-col>

            <v-col cols="4" style="padding:0 10px;">
              <h3 style="border-bottom:1px solid red;margin-bottom:10px;">
                Agenda lainnya
              </h3>
              <v-hover v-slot="{ hover }" v-for="(item, i) in 5" :key="i">
                <router-link
                  style="text-decoration:none;"
                  :to="'/pages/agenda/' + (22341 + i)"
                >
                  <v-card
                    tile
                    :color="hover ? '#e0e0e0' : '#eaeaea'"
                    :elevation="hover ? 3 : 1"
                    :class="{ 'on-hover': hover }"
                    style="margin:0;border:1px solid rgba(0,0,0,0.1); min-height:7vh;cursor:pointer;display:flex;justify-content:flex-start; align-items:flex-start;margin-bottom:10px;"
                  >
                    <h1
                      style="margin-right:5px;background:black; color:white;padding:5px;width:100px;text-align:center;"
                    >
                      #{{ i + 1 }}
                    </h1>
                    <div>
                      <p
                        :style="
                          `color:${
                            hover ? 'blue' : 'black'
                          };margin:0; font-size:16px;line-height:20px;padding:5px 3px;font-weight:bold;`
                        "
                      >
                        Lorem ipsum dolor sit, amet consectetur adipisicing
                        elit. Incidunt, vel!
                      </p>
                    </div>
                  </v-card>
                </router-link>
              </v-hover>
              <v-hover v-slot="{ hover }">
                <div :style="`text-align:right;`">
                  <p
                    @click="gotoList"
                    :style="
                      `cursor:pointer;font-size:14px;color:${
                        hover ? 'blue;' : 'black;'
                      }margin:0;`
                    "
                  >
                    Lihat selengkapnya
                    <v-icon :color="`${hover ? 'blue' : 'black'}`"
                      >mdi-chevron-right</v-icon
                    >
                  </p>
                </div>
              </v-hover>
            </v-col>
          </v-row>
        </v-col>
      </v-row>
    </v-container>
  </div>
</template>

<script>
export default {
  name: 'DetailAgenda',
  components: {
    // ProfileSideNavigation: () => import('../profile/sideNav/Side_Nav')
  },
  data() {
    return {
      wWidth: window.innerWidth,
      text: `<p>Lorem ipsum dolor sit amet consectetur adipisicing elit.
                  Eligendi neque similique, mollitia, est eos sunt reiciendis
                  deleniti blanditiis iusto voluptates explicabo possimus
                  delectus provident in, odit maxime? Sit, voluptas accusamus,
                  voluptatem eveniet minima,
                  <b> dicta aliquid non odio </b> architecto aut ut excepturi
                  pariatur dolorum quia ratione officiis.</p> <p>Itaque ab amet eos
                  voluptatum deserunt eaque minus quaerat nam molestiae, libero
                  numquam a cum sit obcaecati dolore aspernatur. Deserunt
                  accusantium possimus voluptas
                  <i> libero dignissimos optio </i>
                  molestias, ex, perspiciatis culpa totam voluptate corporis.
                  Nihil, voluptatibus ipsum blanditiis ea voluptas accusamus
                  doloremque ullam neque totam fugit deserunt impedit natus at
                  alias eligendi? Cum, id neque.
                  molestias, ex, perspiciatis culpa totam voluptate corporis.
                  Nihil, voluptatibus ipsum blanditiis ea voluptas accusamus
                  doloremque ullam neque totam fugit deserunt impedit natus at
                  alias eligendi? Cum, id neque.
                  molestias, ex, perspiciatis culpa totam voluptate corporis.
                  Nihil, voluptatibus ipsum blanditiis ea voluptas accusamus
                  doloremque ullam neque totam fugit deserunt impedit natus at
                  alias eligendi? Cum, id neque.</p> <p>Eligendi neque 
                  similique, mollitia, est eos sunt reiciendis
                  deleniti blanditiis iusto voluptates explicabo possimus
                  delectus provident in, odit maxime? Sit, voluptas accusamus,
                  voluptatem eveniet minima,
                  <b> dicta aliquid non odio </b> architecto aut ut excepturi
                  pariatur dolorum quia ratione officiis.
                  molestias, ex, perspiciatis culpa totam voluptate corporis.
                  Nihil, voluptatibus ipsum blanditiis ea voluptas accusamus
                  doloremque ullam neque totam fugit deserunt impedit natus at
                  alias eligendi? Cum, id neque.
                  molestias, ex, perspiciatis culpa totam voluptate corporis.
                  Nihil, voluptatibus ipsum blanditiis ea voluptas accusamus
                  doloremque ullam neque totam fugit deserunt impedit natus at
                  alias eligendi? Cum, id neque.</p>`
    }
  },
  watch: {
    '$route.params.id'() {
      this.loadData()
    }
  },
  mounted() {
    window.scrollTo(0, 0)
    this.$nextTick(() => {
      window.addEventListener('resize', this.onResize)
    })
  },
  created() {
    this.loadData()
  },

  beforeDestroy() {
    window.removeEventListener('resize', this.onResize)
  },
  methods: {
    loadData() {
      console.log('tara')
    },
    onResize() {
      this.wWidth = window.innerWidth
    },
    gotoList() {
      this.$router.push('/pages/agenda')
    },
    gotoDetail(pItem, index) {
      this.$router.push('/pages/agenda/' + (22341 + index))
    }
  }
}
</script>
<style lang="scss" scoped>
.hrNews {
  background-image: -webkit-linear-gradient(right, transparent, red);
  background-image: linear-gradient(to left, transparent, red);
  border: 0;
  height: 1px;
  margin: 5px 0;
}
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
