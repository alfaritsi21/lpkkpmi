<template>
  <div class="vBgContainer">
    <v-col class="titleHeaderContent" cols="12"> </v-col>
    <v-container
      id="TulisAgenda"
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
            Tulis Agenda
          </h2>
        </v-col>
        <v-col cols="12" class="d-flex">
          <v-form
            ref="entryForm"
            @submit.prevent="submit"
            style="position: relative;width:100%;"
          >
            <v-row no-gutters style="width:100%;">
              <v-col class="agendaColumnEditor" cols="12">
                <div style="width:100%;">
                  <!-- <div
                  style="height:300px;"
                  class="d-flex justify-center align-center"
                >
                  <div
                    class="d-flex justify-center align-center"
                    :style="
                      `width:50%; height:100%; background-image:url(${API_LINK +
                        '/' +
                        file});color:white;background-repeat:no-repeat; background-size:cover;`
                    "
                  >
                    <v-file-input
                      @change="uploadFile"
                      v-model="fileData"
                      label="UPLOAD GAMBAR"
                      outlined
                      clearable
                      clear-icon="mdi-close"
                      placeholder="Select your file"
                      prepend-icon=""
                      append-icon="mdi-upload"
                      :show-size="1000"
                      :rules="rules.concat(rules2)"
                      style="padding:0 100px;margin:0;height:58px;"
                    ></v-file-input>
                  </div>
                </div> -->
                  <div
                    class="d-flex"
                    style="margin:10px 0 5px;border-radius:3px;"
                  >
                    <v-text-field
                      v-model="title"
                      outlined
                      dense
                      label="Judul"
                      style="margin:0;height:41px;"
                      :rules="titleRules"
                    ></v-text-field>
                  </div>
                  <div class="agendaDateColumn">
                    <div class="d-flex agendaDateInput1">
                      <v-text-field
                        v-model="start_time"
                        :rules="startRules"
                        outlined
                        dense
                        label="Waktu mulai"
                        style="margin:0;height:41px;"
                        type="datetime-local"
                        name="datetime-local"
                      ></v-text-field>
                    </div>
                    <div class="d-flex agendaDateInput2">
                      <v-text-field
                        v-model="end_time"
                        :rules="endRules"
                        outlined
                        dense
                        label="Waktu berakhir"
                        style="margin:0;height:41px;"
                        type="datetime-local"
                        name="datetime-local"
                      ></v-text-field>
                    </div>
                  </div>
                  <div class="d-flex" style="margin:5px 0;border-radius:3px;">
                    <v-text-field
                      v-model="location"
                      outlined
                      dense
                      label="Location"
                      style="margin:0;height:41px;"
                      :rules="locationRules"
                    ></v-text-field>
                  </div>
                  <div style="width:100%;">
                    <vue-editor
                      class="textEditor"
                      v-model="description"
                    ></vue-editor>
                  </div>
                </div>
                <div style="padding:5px 0;">
                  <v-btn
                    type="submit"
                    small
                    tile
                    color="primary"
                    style="width:100px; color: white;"
                    :loading="loading"
                  >
                    Submit
                  </v-btn>
                </div>
              </v-col>
            </v-row>
          </v-form>
        </v-col>
      </v-row>
    </v-container>
  </div>
</template>

<script>
import axios from 'axios'
import buildType from '../../services/buildType'
import { VueEditor } from 'vue2-editor'
export default {
  name: 'BuatBerita',
  components: {
    VueEditor
    // ProfileSideNavigation: () => import('../profile/sideNav/Side_Nav')
  },
  data() {
    return {
      wWidth: window.innerWidth,
      API_LINK: buildType.apiURL('domain'),
      loading: false,
      form: {},
      title: '',
      titleRules: [],
      startRules: [],
      endRules: [],
      locationRules: [],
      // authorRules: [],
      rules: [],
      rules2: [],
      file: null,
      fileData: null,
      location: '',
      start_time: '',
      end_time: '',
      description: ''
    }
  },
  mounted() {
    window.scrollTo(0, 0)
    this.$nextTick(() => {
      window.addEventListener('resize', this.onResize)
    })
    if (this.$route.params.id !== undefined) {
      this.update()
    }
    if (localStorage.getItem('user') === null) {
      this.$store.state.auth.status.loggedIn = false
      this.$router.push('/')
    }
  },
  beforeDestroy() {
    window.removeEventListener('resize', this.onResize)
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
    onResize() {
      this.wWidth = window.innerWidth
    },
    gotoList() {
      this.$router.push('/pages/agenda')
    },
    // gotoDetail(pItem, index) {
    //   this.$router.push('/pages/berita/' + (22341 + index))
    // },
    clear() {
      this.titleRules = []
      this.endRules = []
      this.startRules = []
      this.locationRules = []
      this.title = ''
      this.start_time = ''
      this.end_time = ''
      this.location = ''
      this.description = ''
    },
    addData() {
      this.form = {
        title: '',
        start_time: '',
        end_time: '',
        location: '',
        description: ''
      }
    },
    update() {
      axios
        .get(`${this.API_LINK}/agenda/${this.$route.params.id}`)
        .then(res => {
          const v = res.data.data[0]
          this.title = v.title
          this.start_time = this.convertDate(v.start_time)
          this.end_time = this.convertDate(v.end_time)
          this.location = v.location
          this.description = v.description
        })
        .catch(err => {
          console.log(err)
        })
    },
    submit() {
      this.endRules = [v => !!v || '']
      this.startRules = [v => !!v || '']
      this.locationRules = [v => !!v || '']
      this.titleRules = [v => !!v || '']
      // this.authorRules = [v => !!v || '']

      const self = this
      setTimeout(function() {
        if (self.$refs.entryForm.validate()) {
          this.loading = true
          self.createNewForm()
        }
      })
    },
    createNewForm() {
      const newForm = {
        title: this.title,
        start_time: this.start_time,
        end_time: this.end_time,
        location: this.location,
        description: this.description
      }
      this.act(newForm)
    },
    act(form) {
      this.showMsgDialog('question', 'Simpan', true).then(res => {
        if (res.value) {
          if (this.$route.params.id === undefined) {
            this.saveAdd(form)
          } else {
            this.saveEdit(form)
          }
        } else {
          this.loading = false
        }
      })
    },
    saveAdd(form) {
      axios
        .post(`${this.API_LINK}/agenda`, form)
        .then(res => {
          this.loading = false
          this.showMsgDialog('success', res.data.msg, false)
          this.clear()
          // this.update()
        })
        .catch(err => {
          this.loading = false
          this.clear()
          this.showMsgDialog(
            'error',
            err
              ? 'Something went wrong, Please contact an admin!'
              : 'Something went wrong, Please contact an admin!',
            false
          )
        })
    },
    saveEdit(form) {
      axios
        .patch(`${this.API_LINK}/agenda/${this.$route.params.id}`, form)
        .then(res => {
          this.loading = false
          if (res.data.status === 200) {
            this.showMsgDialog('success', res.data.msg, false)
            this.clear()
            // this.update()
          } else {
            this.clear()
            this.showMsgDialog('error', res.data.msg, false)
          }
        })
        .catch(err => {
          this.clear()
          this.loading = false
          this.showMsgDialog(
            'error',
            err
              ? 'Something went wrong, Please contact an admin!'
              : 'Something went wrong, Please contact an admin!',
            false
          )
        })
    },

    convertDate(raw) {
      const d = new Date(raw)
      const date = new Date(raw).toLocaleDateString()
      const n = date
        .split('/')
        .reverse()
        .join('-')
      return (
        n +
        'T' +
        d.toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' })
      )
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
.agendaColumnEditor {
  font-family: 'Arial Narrow';
  width: 100%;
  padding: 0 100px 40px !important;
}
.textEditor {
  border: 1px solid rgba(0, 0, 0, 0.4);
  // width:955px;
}

.agendaDateColumn {
  display: flex;

  .agendaDateInput1 {
    margin: 5px 0;
    border-radius: 3px;
    width: 40%;
    margin-right: 15px;
  }
  .agendaDateInput2 {
    margin: 5px 0;
    border-radius: 3px;
    width: 40%;
  }
}

@media (max-width: 720px) {
  .agendaColumnEditor {
    padding: 0 !important;
  }
  .agendaDateColumn {
    flex-direction: column;

    .agendaDateInput1 {
      width: 100%;
    }
    .agendaDateInput2 {
      width: 100%;
    }
  }
}
</style>
