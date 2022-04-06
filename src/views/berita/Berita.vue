<template>
  <div class="vBgContainer" v-if="result !== null">
    <v-col class="titleHeaderContent" cols="12"> </v-col>
    <v-container
      id="Berita"
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
            Berita Seputar LSP
          </h2>
        </v-col>
        <v-col cols="12" class="d-flex">
          <v-row>
            <v-col cols="12" md="8" style="font-family: 'Arial Narrow';">
              <div
                :style="
                  `background-image: url(${API_LINK +
                    '/uploads/' +
                    (result.file !== null
                      ? result.file
                      : '2021-08-31T22-24-31.598Z-images.png')});background-size:100% 100%;height:400px;`
                "
                class="newsMainImage d-flex justify-center align-center"
              ></div>
              <div style="margin-bottom:10px ">
                <p style="0; font-size:32px; font-weight:600;color:#06125c;">
                  {{ result.title }}
                </p>
              </div>
              <div style="font-size:12px; font-weight:bold;margin-bottom:20px;">
                <div class="d-flex justify-start align-center">
                  <div
                    class="d-flex justify-start align-center"
                    style="margin-right:20px;"
                  >
                    <v-icon style="margin-right:5px;">mdi-calendar</v-icon>
                    <p style="margin:0;">
                      {{ convertDay(result.created_at) + ', ' }}
                      {{ convertDate(result.created_at) + ' ' }}
                      {{ convertTime(result.created_at) }} WIB
                    </p>
                  </div>
                  <!-- <div
                    class="d-flex justify-start align-center"
                    style="margin-right:20px;"
                  >
                    <v-icon style="margin-right:5px;">mdi-account-edit</v-icon>
                    <p style="margin:0;">Muhammad Rizki Mulya</p>
                  </div> -->
                  <div v-if="$store.state.auth.status.loggedIn">
                    <router-link
                      style="text-decoration:none;"
                      :to="`/pages/tulis_berita/${$route.params.id}`"
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
                <div v-html="result.body"></div>
              </div>
            </v-col>

            <v-col cols="12" md="4" style="padding:0 10px;">
              <h3 style="border-bottom:1px solid red;margin-bottom:10px;">
                Berita lainnya
              </h3>
              <v-hover
                v-slot="{ hover }"
                v-for="(item, i) in listBerita"
                :key="i"
              >
                <router-link
                  v-if="i < 5"
                  style="text-decoration:none;"
                  :to="'/pages/berita/' + item.id"
                >
                  <v-card
                    tile
                    :color="hover ? '#e0e0e0' : '#eaeaea'"
                    :elevation="hover ? 3 : 1"
                    :class="{ 'on-hover': hover }"
                    style="margin:0;border:1px solid rgba(0,0,0,0.1); height:7vh;cursor:pointer;display:flex;margin-bottom:10px;"
                  >
                    <h1
                      style="margin-right:5px;background:black; color:white;padding:5px;text-align:center;"
                    >
                      #{{ i + 1 }}
                    </h1>
                    <div>
                      <p
                        :style="
                          `color:${
                            hover ? 'blue' : 'black'
                          };height:6.5vh;overflow:auto;margin:0; font-size:16px;line-height:20px;padding:5px 3px;font-weight:bold;`
                        "
                      >
                        {{ item.title }}
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
                      `cursor:pointer;font-size:14px;margin-left:auto;box-shadow:1px 1px 5px grey;border:1px solid grey; width:150px;border-radius:5px;background:white;color:${
                        hover ? 'blue;' : 'black;'
                      }`
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
import axios from 'axios'
import buildType from '../../services/buildType'
export default {
  name: 'DetailBerita',
  components: {
    // ProfileSideNavigation: () => import('../profile/sideNav/Side_Nav')
  },
  data() {
    return {
      API_LINK: buildType.apiURL('domain'),
      wWidth: window.innerWidth,
      result: null,
      listBerita: []
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
    this.loadData()
  },

  beforeDestroy() {
    window.removeEventListener('resize', this.onResize)
  },
  methods: {
    loadData() {
      this.loadList()
      axios
        .get(`http://localhost:3001/articles/${this.$route.params.id}`)
        // .get(`${this.API_LINK}/articles/${this.$route.params.id}`)
        .then(res => {
          this.result = res.data.data[0]
        })
        .catch(err => {
          console.log(err)
        })
    },
    loadList() {
      axios
        .get('http://localhost:3001/articles')
        // .get(`${this.API_LINK}/articles`)
        .then(res => {
          this.listBerita = res.data.data
        })
        .catch(err => {
          console.log(err)
        })
    },
    onResize() {
      this.wWidth = window.innerWidth
    },
    gotoList() {
      this.$router.push('/pages/berita')
    },
    gotoDetail(pItem, index) {
      this.$router.push('/pages/berita/' + (22341 + index))
    },

    convertDate(raw) {
      const date = new Date(raw).toLocaleDateString()

      const day = date.slice(0, date.indexOf('/'))
      let month = date.slice(date.indexOf('/') + 1, date.lastIndexOf('/'))
      const year = date.slice(date.lastIndexOf('/') + 1)

      switch (month) {
        case '01':
          month = 'Jan'
          break
        case '02':
          month = 'Feb'
          break
        case '03':
          month = 'Mar'
          break
        case '04':
          month = 'Apr'
          break
        case '05':
          month = 'May'
          break
        case '06':
          month = 'Jun'
          break
        case '07':
          month = 'Jul'
          break
        case '08':
          month = 'Agu'
          break
        case '09':
          month = 'Sep'
          break
        case '10':
          month = 'Okt'
          break
        case '11':
          month = 'NOV'
          break
        case '12':
          month = 'DES'
          break
      }
      return day + ' ' + month + ' ' + year
    },
    convertDay(raw) {
      var d = new Date(raw)
      var weekday = new Array(7)
      weekday[0] = 'Minggu'
      weekday[1] = 'Senin'
      weekday[2] = 'Selasa'
      weekday[3] = 'Rabu'
      weekday[4] = 'Kamis'
      weekday[5] = "Jum'at"
      weekday[6] = 'Sabtu'

      var n = weekday[d.getDay()]
      return n
    },
    convertTime(raw) {
      var d = new Date(raw)
      var n = d.toLocaleTimeString()
      return n.slice(0, n.lastIndexOf(':'))
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

@media (max-width: 710px) {
}
</style>
