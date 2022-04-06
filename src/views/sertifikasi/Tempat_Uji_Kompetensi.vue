<template>
  <div class="vBgContainer">
    <v-col class="titleHeaderContent" cols="12"> </v-col>
    <div
      :class="
        `d-flex justify-center align-center ${
          wWidth < 965 ? 'flex-column' : ''
        }`
      "
      :style="
        `padding:${
          wWidth < 965 ? '0' : '0 15px'
        };min-height:75vh; position:relative; background:rgba(255,255,255,0.4);`
      "
    >
      <v-container
        id="TempatUjiKompetensi"
        :fluid="wWidth < 965 ? true : false"
        tag="section"
        :style="
          `padding: ${
            wWidth < 965 ? '15px 0' : '15px 15px'
          };height:100%; transition:0.5s; width:${
            isPdfOpen ? (wWidth < 965 ? '100%' : '40%') : '100%'
          };position:relative; top:-47px;`
        "
      >
        <v-row
          align="center"
          style="font-size:18px;padding:0;margin:0;min-height:75vh;"
        >
          <v-col
            cols="12"
            class="d-flex"
            style="position:relative; top:-42px;padding:0 20px;"
          >
            <h2
              class="hTitle"
              :style="`${wWidth < 353 ? 'line-height:21px' : 'none'};`"
            >
              Tempat Uji Kompetensi
            </h2>
          </v-col>
          <v-col cols="12" style="padding:0 20px;">
            <v-card tile elevation="1" text class="skemaTableDiv">
              <div
                :style="
                  `${
                    wWidth < 920
                      ? ''
                      : 'display:flex; justify-content:space-between; align-items:center;'
                  }`
                "
              >
                <v-toolbar-title
                  :style="
                    `font-size:${
                      wWidth < 590 ? '14px' : '16px'
                    };font-weight:400;height:50px;`
                  "
                >
                  Daftar Tempat Uji Kompetensi LSP Promigas Indonesia
                </v-toolbar-title>
                <v-btn
                  v-if="$store.state.auth.status.loggedIn"
                  style="
                      font-size: 10px; margin-right:10px;
                      "
                  elevation="2"
                  tilerounded="5px"
                  color="black"
                  class="white--text"
                  @click="addItem"
                >
                  <template>
                    <v-icon small>
                      mdi-plus
                    </v-icon>
                    tambah data
                  </template>
                </v-btn>
              </div>
              <v-data-table
                fixed-header
                :headers="headers"
                height="50vh"
                :items="result"
                :items-per-page="limit"
                class="elevation-1 skemaTable"
                :footer-props="{
                  prevIcon: 'mdi-chevron-left',
                  nextIcon: 'mdi-chevron-right'
                }"
                hide-default-footer
              >
                <!-- <template v-slot:[`header.no`]="{ header }">
                  <div style="font-weight:bold; padding:0;font-size:14px">
                    {{ header.text }}
                  </div>
                </template> -->
                <template v-slot:[`header.nama_tuk`]="{ header }">
                  <div style="font-weight:bold; padding:0;font-size:14px">
                    {{ header.text }}
                  </div>
                </template>
                <template v-slot:[`header.alamat_tuk`]="{ header }">
                  <div style="font-weight:bold; padding:0;font-size:14px">
                    {{ header.text }}
                  </div>
                </template>
                <!-- <template v-slot:[`item.no`]="{ index }">
                  <div>{{ index + 1 }}</div>
                </template> -->
                <template v-slot:[`item.nama_tuk`]="{ item }">
                  <div v-html="item.nama_tuk"></div>
                </template>
                <template v-slot:[`item.action`]="{ item }">
                  <div
                    v-if="$store.state.auth.status.loggedIn"
                    class="d-flex justify-center align-center"
                  >
                    <div class="mr-2">
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
                </template>
              </v-data-table>
              <div style="display:flex;">
                <v-pagination
                  style="margin-right:auto; color:black;"
                  v-model="page"
                  total-visible="7"
                  :length="totalPage"
                  circle
                  prev-icon="mdi-menu-left"
                  next-icon="mdi-menu-right"
                  @input="changePage"
                ></v-pagination>
              </div>
            </v-card>
          </v-col>
        </v-row>
      </v-container>
      <!-- <div
        v-if="isPdfOpen"
        id="skemaPDF"
        :style="
          `width:${
            isPdfOpen ? (wWidth < 965 ? '90%' : '60%') : '0'
          };padding:0;transition:0.5s; padding: 0 10px; min-height:75vh;position:relative; z-index:2; overflow:hidden;background:${
            isPdfOpen ? (wWidth < 965 ? 'black' : 'black') : 'transparent'
          };border-radius:5px;box-shadow:${
            isPdfOpen ? 'inset 1px 5px 15px black' : 'none'
          };${
            wWidth < 965
              ? 'position:fixed; top:80px;border:1px solid left:0;'
              : 'position:relative'
          };`
        "
      >
        <div
          class="d-flex justify-center align-center"
          style="position:absolute; top:0; left:0;z-index:2; height:40px; width:50px; background:black;"
        >
          <button
            x-small
            color="white"
            style="cursor:pointer;font-size:12px;padding:2px 4px; border:1px solid red; border-radius:5px;color:white;"
            @click="open"
          >
            close
          </button>
        </div>
        <div
          id="loader"
          class="d-flex justify-center align-center"
          style="position:absolute;top:0; left:0;width:100%; min-height:100%;"
        >
          <v-progress-circular
            v-if="isPdfOpen"
            :rotate="-90"
            :size="150"
            :width="15"
            :value="value"
            color="white"
          >
            {{ value / 10 }}%
          </v-progress-circular>
        </div>
        <div v-if="showPdf" style="height:80vh;padding: 5px 0;"></div>
      </div> -->
    </div>
    <form-edit
      :param="{
        act: 'edit',
        data: detail
      }"
      @loadTable="loadTable"
    />
    <form-add
      :param="{
        act: 'add',
        data: detail
      }"
      @loadTable="loadTable"
    />
  </div>
</template>

<script>
import axios from 'axios'
import buildType from '../../services/buildType'
export default {
  name: 'TempatUjiKompetensi',
  components: {
    formEdit: () => import('./form/Tempat_Uji_Kompetensi'),
    formAdd: () => import('./form/Tempat_Uji_Kompetensi')
  },
  data() {
    return {
      API_LINK: buildType.apiURL('domain'),
      page: 1,
      limit: 10,
      totalPage: 0,
      interval: {},
      value: 0,
      counter: 0,
      timer: 100,
      wWidth: window.innerWidth,
      isPdfOpen: false,
      showPdf: false,
      detail: null,
      headers: [
        // { text: 'No', value: 'no', sortable: false, width: '40px' },
        {
          text: 'Tempat Uji Kompetensi',
          align: 'start',
          sortable: false,
          value: 'nama_tuk'
        },
        {
          text: 'Alamat',
          align: 'start',
          sortable: false,
          value: 'alamat_tuk'
        },
        {
          text: '',
          align: 'start',
          sortable: false,
          value: 'action'
        }
      ],
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
  // created() {
  //   this.loadTable()
  // },

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
    changePage() {
      this.loadTable()
    },
    loadTable() {
      axios
        .get(`${this.API_LINK}/tuk?page=${this.page}&limit=${this.limit}`)
        .then(res => {
          this.totalPage = res.data.data.pageInfo.totalPage
          this.result = res.data.data.result
        })
        .catch(err => {
          console.log(err)
        })
    },
    countDownTimer() {
      if (this.counter < this.timer) {
        setTimeout(() => {
          this.counter += 1
          this.value += 10
          this.countDownTimer()
        }, 1)
      } else {
        this.showPdf = true
        this.value = 0
        this.counter = 0
      }
    },
    onResize() {
      this.wWidth = window.innerWidth
    },
    addItem() {
      setTimeout(() => {
        document.getElementById('tukAdd').click()
      }, 500)
    },
    editItem(val) {
      this.detail = val
      setTimeout(() => {
        document.getElementById('tukEdit').click()
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
            .delete(`${this.API_LINK}/tuk/${id}`)
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
.skemaTableDiv {
  width: 100%;
  height: 100%;
  margin: 0;
  padding: 15px;
}
.skemaTable {
  border: 1px solid #e0e0e0;
}
.viewDetailIcon {
  cursor: pointer;
  border: 1px solid #c5c5c5cb;
  border-radius: 5px;
  &:hover {
    background: rgba(192, 192, 192, 0.616);
  }
  &:active {
    box-shadow: inset 1px 1px 7px rgba(99, 99, 99, 0.637);
  }
}
@media (max-width: 600px) {
  .skemaTable {
    width: 600px;
    overflow: auto;
  }
  .skemaTable {
    border: 1px solid #e0e0e0;
  }
}
</style>
