<template>
  <v-item-group class="vBgContainer">
    <v-col class="titleHeaderContent" cols="12"> </v-col>
    <v-container
      id="Gallery"
      tag="section"
      style="padding: 0 15px;min-height:75vh; position:relative; top:-30px;background:rgba(255,255,255,0.7);"
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
          <h2 class="hTitle">Dokumentasi Kegiatan</h2>
          <v-spacer></v-spacer>
          <v-btn
            v-if="$store.state.auth.status.loggedIn"
            style="font-size: 10px; margin-top:auto;position:relative;top:30px;"
            elevation="2"
            tilerounded="5px"
            x-small
            color="black"
            class="white--text"
            @click="addItem"
          >
            <template>
              <v-icon x-small class="">
                mdi-plus
              </v-icon>
              Tambahkan foto
            </template>
          </v-btn>
        </v-col>
        <!-- <v-col
          v-for="(item, index) in img"
          :key="index"
          class="d-flex child-flex"
          cols="6"
          md="3"
          style="padding:5px;"
        >
          <v-item v-slot="{ toggle }">
            <v-card
              class="d-flex align-center"
              dark
              height="200"
              @click="toggle"
            >
            </v-card>
          </v-item>
        </v-col> -->
        <v-col
          v-for="(n, i) in paginatedData"
          :key="i"
          class="d-flex child-flex"
          cols="6"
          md="4"
          style="padding:5px;"
        >
          <div
            v-if="i < paramAPI.limit * paramAPI.page"
            style="position:relative;"
          >
            <div
              v-if="$store.state.auth.status.loggedIn"
              style="position:absolute; bottom:0; right:3px;z-index:2;"
            >
              <v-tooltip bottom>
                <template v-slot:activator="{ on, attrs }">
                  <v-icon
                    small
                    color="error"
                    v-bind="attrs"
                    v-on="on"
                    @click="deleteItem(n.id)"
                    style="border:1px solid red; border-radius:5px;background:white;"
                    >mdi-delete</v-icon
                  >
                </template>
                <span>Delete</span>
              </v-tooltip>
            </div>
            <v-item>
              <v-card
                class="d-flex align-center"
                tile
                :style="`padding:0; margin:0;filter: blur(8px);`"
              >
                <v-img
                  :src="`${API_LINK}uploads/${n.file}`"
                  :lazy-src="`https://picsum.photos/10/6?image=${15 * 5 + 10}`"
                  aspect-ratio="1.7"
                  class="grey lighten-2"
                >
                  <template v-slot:placeholder>
                    <v-row
                      class="fill-height ma-0"
                      align="center"
                      justify="center"
                    >
                      <v-progress-circular
                        indeterminate
                        color="grey lighten-5"
                      ></v-progress-circular>
                    </v-row>
                  </template>
                </v-img>
              </v-card>
            </v-item>
            <v-item
              v-slot="{ active, toggle }"
              style="position:absolute; top:0; left:0;bottom:0; right:0; z-index:1;"
            >
              <v-card
                class="d-flex align-center vItemToggleCard"
                tile
                :style="`padding:0; margin:0;background:transparent;`"
                @click="toggle"
              >
                <v-img
                  @click="viewImage(n.file, i, n.caption)"
                  :src="`${API_LINK + 'uploads/' + n.file}`"
                  :lazy-src="`https://picsum.photos/10/6?image=${15 * 5 + 10}`"
                  aspect-ratio="1.7"
                  class="grey lighten-2"
                  :style="
                    `${
                      active ? 'transform:scale(0.5,0.5)' : ''
                    }; transition:0.5s;`
                  "
                >
                  <template v-slot:placeholder>
                    <v-row
                      class="fill-height ma-0"
                      align="center"
                      justify="center"
                    >
                      <v-progress-circular
                        indeterminate
                        color="grey lighten-5"
                      ></v-progress-circular>
                    </v-row>
                  </template>
                </v-img>
              </v-card>
            </v-item>
          </div>
        </v-col>
        <v-col
          cols="12"
          style="margin-top:10px;margin-bottom:20px;"
          v-if="result.length > 0"
        >
          <div style="display:flex;">
            <v-pagination
              style="margin-right:auto; color:black;"
              v-model="paramAPI.page"
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
    <v-dialog @click:outside="close" v-model="dialog" width="80%">
      <v-card color="transparent" style="min-height:300px; position:relative;">
        <v-btn
          class="ma-2"
          text
          style="position:absolute; top:0; left:0;z-index:1;"
          icon
          small
          color="white"
          @click="close"
        >
          <v-icon style="background:red;">mdi-close</v-icon>
        </v-btn>

        <v-img
          v-if="selectedPict !== null"
          :src="`${API_LINK + 'uploads/' + selectedPict}`"
          :lazy-src="`https://picsum.photos/10/6?image=${15 * 5 + 10}`"
          aspect-ratio="1.7"
          class="grey lighten-2"
          cover
        >
          <template v-slot:placeholder>
            <v-row class="fill-height ma-0" align="center" justify="center">
              <v-progress-circular
                indeterminate
                color="grey lighten-5"
              ></v-progress-circular>
            </v-row>
          </template>
        </v-img>
        <div
          style="height:30px;background:white;"
          class="d-flex justify-center align-center"
        >
          {{ caption }}
        </div>
      </v-card>
    </v-dialog>
    <form-upload @loadImage="loadImage" />
  </v-item-group>
</template>

<script>
import axios from 'axios'
import buildType from '../../services/buildType'
// import authHeader from '../../services/authheader'
export default {
  name: 'Gallery',
  components: {
    formUpload: () => import('./form/Upload_Foto')
  },

  data() {
    return {
      API_LINK: buildType.apiURL('domain'),
      toggle: false,
      dialog: false,
      imageIndex: 0,
      paramAPI: {
        page: 1,
        offset: 0,
        limit: 6,
        total_record: 0
      },
      selectedPict: null,
      caption: '',
      result: []
    }
  },
  computed: {
    pageCount() {
      const l = this.result.length
      const s = this.paramAPI.limit
      return Math.ceil(l / s)
    },
    paginatedData() {
      const start = (this.paramAPI.page - 1) * this.paramAPI.limit
      const end = start + this.paramAPI.limit
      return this.result.slice(start, end)
    }
  },
  mounted() {
    window.scrollTo(0, 0)
    this.loadImage()
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
    loadImage() {
      axios
        // .get('http://localhost:3001/dokumentasi')
        .get(`${this.API_LINK}dokumentasi`)
        .then(res => {
          this.total_record = res.data.data.length
          this.result = res.data.data
        })
        .catch(err => {
          console.log(err)
        })
    },
    viewImage(file, i, caption) {
      this.imageIndex = i
      this.selectedPict = file
      this.caption = caption
      this.dialog = true
    },
    close() {
      const el = document.getElementsByClassName('vItemToggleCard')[
        this.imageIndex
      ]
      el.click()
      this.selectedPict = null
      this.dialog = false
    },
    addItem() {
      setTimeout(() => {
        document.getElementById('galleryUpload').click()
      }, 500)
    },
    deleteItem(id) {
      this.showMsgDialog(
        'warning',
        'Setelah terhapus data tidak dapat dikembalikan, lanjutkan ?',
        true
      ).then(res => {
        if (res.value) {
          axios
            .delete(`${this.API_LINK}dokumentasi/${id}`)
            .then(res => {
              this.showMsgDialog('success', res.data.msg, false)
              this.loadImage()
            })
            .catch(err => {
              console.log(err)
            })
        }
      })
    }
    // imageLink(file) {
    //   return require('http://127.0.0.1:3001/2021-08-20T07-48-50.570Z-s.png')
    // }
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
