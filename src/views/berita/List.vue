<template>
  <div class="vBgContainer">
    <v-col class="titleHeaderContent" cols="12"> </v-col>
    <v-container id="ListBerita" tag="section">
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
            Kolom Berita
          </h2>
          <v-spacer></v-spacer>
          <v-btn
            v-if="$store.state.auth.status.loggedIn"
            style="font-size: 14px; margin-top:10px;position:relative;top:35px;left:30px;"
            elevation="2"
            tilerounded="5px"
            x-small
            color="black"
            class="white--text"
            @click="createNews"
          >
            <template>
              <v-icon x-small class="">
                mdi-plus
              </v-icon>
              Buat Artikel
            </template>
          </v-btn>
        </v-col>
        <v-col
          cols="12"
          class="d-flex"
          style="border-bottom:2px solid grey; height:62vh; overflow:auto;width:100%"
        >
          <v-row no-gutters style="width:100%">
            <v-col
              v-for="(item, i) in paginatedData"
              :key="i"
              cols="12"
              class="newsColContent"
              :style="`margin-top:${i === 0 ? '0' : '10px'};`"
            >
              <div class="d-flex justify-start align-start">
                <div class="newsMainImage">
                  <v-img
                    :src="
                      `${API_LINK +
                        '/uploads/' +
                        (item.file !== null
                          ? item.file
                          : '2021-08-31T22-24-31.598Z-images.png')}`
                    "
                    :lazy-src="
                      `https://picsum.photos/10/6?image=${15 * 5 + 10}`
                    "
                    class="grey lighten-2 newsImage"
                  ></v-img>
                </div>
                <div class="newsMainContent">
                  <div
                    style="width:100%;margin-bottom:0; max-height:60px; overflow:auto;"
                  >
                    <v-hover v-slot="{ hover }">
                      <router-link
                        :style="
                          `text-decoration: ${
                            hover ? 'underline' : 'none'
                          };font-size:16px;`
                        "
                        :to="`/pages/berita/${item.id}`"
                      >
                        <p class="mainContentP">
                          {{ item.title }}
                        </p></router-link
                      >
                    </v-hover>
                  </div>
                  <div
                    style="font-size:12px; font-weight:bold;margin-bottom:10;"
                  >
                    <div class="d-flex justify-start align-center; ">
                      <div
                        class="d-flex justify-start align-center"
                        style="padding-right:15px;"
                      >
                        <v-icon style="margin-right:5px;">mdi-calendar</v-icon>
                        <p style="margin:0;">
                          {{ convertDay(item.created_at) + ', ' }}
                          {{ convertDate(item.created_at) + ' ' }}
                          {{ convertTime(item.created_at) }} WIB
                        </p>
                      </div>

                      <!-- <div
                        class="d-flex justify-start align-center"
                        style="padding-left:10px;padding-right:15px;"
                      >
                        <v-icon style="margin-right:5px;"
                          >mdi-account-edit</v-icon
                        >
                        <p style="margin:0;">Rizki Mulya</p>
                      </div> -->
                    </div>
                  </div>
                  <div
                    style="padding:10px 0 0 0;font-size:16px; text-align;border-bottom:1px solid #e0e0e0;height:90px; overflow:hidden;"
                  >
                    <div
                      style="margin:0;padding-left:25px;"
                      v-html="item.body"
                    ></div>
                  </div>
                  <div class="d-flex align-center justify-end">
                    <div>
                      <v-hover v-slot="{ hover }">
                        <router-link
                          :style="
                            `text-decoration: ${
                              hover ? 'underline' : 'none'
                            };font-size:16px;`
                          "
                          :to="`/pages/berita/${item.id}`"
                          >Baca Selengkapnya...</router-link
                        >
                      </v-hover>
                    </div>
                    <div
                      v-if="$store.state.auth.status.loggedIn"
                      class="d-flex justify-start align-center"
                      style="padding-left:10px;"
                    >
                      <div style="margin-right:7px;">
                        <v-tooltip bottom>
                          <template v-slot:activator="{ on, attrs }">
                            <v-icon
                              color="success"
                              v-bind="attrs"
                              v-on="on"
                              @click="editItem(item)"
                              style="border:1px solid green; border-radius:5px;"
                              >mdi-pencil</v-icon
                            >
                          </template>
                          <span>Edit</span>
                        </v-tooltip>
                      </div>
                      <div>
                        <v-tooltip bottom>
                          <template v-slot:activator="{ on, attrs }">
                            <v-icon
                              color="error"
                              v-bind="attrs"
                              v-on="on"
                              @click="deleteItem(item.id)"
                              style="border:1px solid red; border-radius:5px;"
                              >mdi-delete</v-icon
                            >
                          </template>
                          <span>Delete</span>
                        </v-tooltip>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </v-col>
          </v-row>
        </v-col>
        <v-col
          cols="12"
          style="margin-top:10px;margin-bottom:20px;"
          v-if="result.length > 0"
        >
          <div style="display:flex;">
            <v-pagination
              style="margin-right:auto; color:black;"
              v-model="page"
              total-visible="7"
              :length="pageCount"
              circle
              prev-icon="mdi-menu-left"
              next-icon="mdi-menu-right"
            ></v-pagination>
          </div>
        </v-col>
      </v-row>
    </v-container>
  </div>
</template>

<script>
import axios from 'axios'
import buildType from '../../services/buildType'
export default {
  name: 'ListBerita',
  components: {
    // ProfileSideNavigation: () => import('../profile/sideNav/Side_Nav')
  },
  data() {
    return {
      wWidth: window.innerWidth,
      API_LINK: buildType.apiURL('domain'),
      page: 1,
      keyword: '',
      offset: 0,
      limit: 2,
      status: '',
      total_record: 0,
      sortBy: 'name',
      sortType: 'asc',
      result: []
    }
  },
  mounted() {
    window.scrollTo(0, 0)
    this.$nextTick(() => {
      window.addEventListener('resize', this.onResize)
    })
    this.loadTable()
  },

  beforeDestroy() {
    window.removeEventListener('resize', this.onResize)
  },
  computed: {
    pageCount() {
      const l = this.result.length
      const s = this.limit
      return Math.ceil(l / s)
    },
    paginatedData() {
      const start = (this.page - 1) * this.limit
      const end = start + this.limit
      return this.result.slice(start, end)
    }
  },

  methods: {
    showMsgDialog(pModalType, pStatusMsg, pBtnCancel) {
      return new Promise(resolve => {
        this.$fire({
          html: '<strong style="font-size:18px;">' + pStatusMsg + '</strong>',
          type: pModalType,
          showConfirmButton: true,
          showCancelButton: pBtnCancel,
          cancelButtonText: 'No'
        }).then(r => {
          resolve(r)
        })
      })
    },
    loadTable() {
      axios
        .get('http://localhost:3001/articles')
        // .get(`${this.API_LINK}/articles`)
        .then(res => {
          this.result = res.data.data
        })
        .catch(err => {
          console.log(err)
        })
    },
    editItem(val) {
      this.$router.push(`/pages/tulis_berita/${val.id}`)
    },
    onResize() {
      this.wWidth = window.innerWidth
    },
    createNews() {
      this.$router.push('/pages/tulis_berita')
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
    },
    deleteItem(id) {
      this.showMsgDialog(
        'warning',
        'Setelah terhapus data tidak dapat dikembalikan, lanjutkan ?',
        true
      ).then(res => {
        if (res.value) {
          axios
            .delete(`${this.API_LINK}/articles/${id}`)
            .then(res => {
              this.showMsgDialog('success', res.data.msg, false)
              this.loadTable()
            })
            .catch(err => {
              console.log(err)
            })
        }
      })
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

#ListBerita {
  padding: 0 15px;
  min-height: 75vh;
  position: relative;
  top: -30px;
  background: rgba(255, 255, 255, 0.9);
}
.newsColContent {
  font-family: 'Arial Narrow';
  padding: 0 100px 0 20px !important;
  border-bottom: 1px solid rgba(0, 0, 0, 0.2);
  position: relative;
  width: 100%;
}
.newsMainImage {
  display: flex;
  justify-content: center;
  align-content: center;
  background: grey;
  height: 190px;
  width: 25%;
  margin-right: 10px;

  .newsImage {
    height: 100%;
    width: 100%;
  }
  .subMainImage {
    height: 100%;
    background: rgb(204, 204, 204);
    position: relative;
    .mainImageBorder {
      position: absolute;
      top: 0;
      left: 0;
      bottom: 0;
      width: 25px;
      background: #06125c;
    }
    .mainImagep1 {
      color: black;
      margin: 0 0 15px 0;
      font-size: 36px;
      font-weight: 600;
      line-height: 22px;
      text-align: center;
    }
    .mainImagep2 {
      color: black;
      margin: 0;
      font-size: 24px;
      font-weight: 600;
    }
  }
}
.newsMainContent {
  width: 75%;
  padding: 0 20px;

  .mainContentP {
    width: 100%;
    line-height: 30px;
    font-size: 26px;
    font-weight: 400;
    color: #06125c;
    margin-bottom: 10px;
  }
}
@media (max-width: 1260px) {
  .newsColContent {
    padding: 0 0 0 20px !important;
  }
  .newsMainImage {
    width: 35%;
  }
  .newsMainContent {
    width: 65%;
    padding: 0 10px;

    .mainContentP {
      line-height: 26px;
      font-size: 24px;
    }
  }
}
@media (max-width: 710px) {
  .newsMainImage {
    display: none;
  }

  .newsMainContent {
    width: 100%;
    .mainContentP {
      line-height: 24px;
    }
  }
}
@media (max-width: 380px) {
  .newsMainContent {
    .mainContentP {
      font-size: 20px;
    }
  }
}
</style>
