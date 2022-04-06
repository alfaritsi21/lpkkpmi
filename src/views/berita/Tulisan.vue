<template>
  <div class="vBgContainer">
    <v-col class="titleHeaderContent" cols="12"> </v-col>
    <v-container
      id="TulisBerita"
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
            Tulis Berita
          </h2>
        </v-col>
        <v-col cols="12" class="d-flex">
          <v-form
            ref="entryForm"
            @submit.prevent="submit"
            style="position: relative; width:100%;"
          >
            <v-row no-gutters style="width:100%;">
              <v-col cols="12" class="beritaColumnEditor">
                <div
                  style="height:300px;width:100%;"
                  class="d-flex justify-center align-center"
                >
                  <div
                    class="d-flex justify-center align-center newsImageInput"
                    :style="
                      `background-image:${
                        file !== null
                          ? 'url(' + API_LINK + '/uploads/' + file + ')'
                          : 'none'
                      };color:white;background-repeat:no-repeat; background-size:100% 100%;`
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
                      style="padding:0 20px;margin:0;height:58px;width:100%;color:red;"
                    ></v-file-input>
                  </div>
                </div>
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
                <!-- <div class="d-flex" style="margin:5px 0;border-radius:3px;">
                  <v-text-field
                    v-model="author"
                    outlined
                    dense
                    label="Author"
                    style="margin:0;height:41px;"
                    :rules="authorRules"
                  ></v-text-field>
                </div> -->
                <div style="width:100%;">
                  <vue-editor class="textEditor" v-model="content"></vue-editor>
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
      author: '',
      content: '',
      titleRules: [],
      // authorRules: [],
      rules: [],
      rules2: [],
      file: null,
      fileData: null
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
      this.$router.push('/pages/berita')
    },
    gotoDetail(pItem, index) {
      this.$router.push('/pages/berita/' + (22341 + index))
    },
    clear() {
      this.titleRules = []
      // this.authorRules = []
      this.file = null
      this.fileData = null
      this.title = ''
      this.author = ''
      this.content = ''
    },
    addData() {
      this.form = {
        title: '',
        body: '',
        file: ''
      }
    },
    update() {
      axios
        .get(`${this.API_LINK}/articles/${this.$route.params.id}`)
        .then(res => {
          const v = res.data.data[0]
          this.title = v.title
          this.content = v.body
          this.file = v.file
        })
        .catch(err => {
          console.log(err)
        })
    },
    submit() {
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
        // author: this.author,
        title: this.title,
        body: this.content,
        file: this.file
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
        .post(`${this.API_LINK}/articles`, form)
        .then(res => {
          this.loading = false
          this.showMsgDialog('success', res.data.msg, false)
          this.clear()
          // this.update()
        })
        .catch(err => {
          console.log(err)
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
        .patch(`${this.API_LINK}/articles/${this.$route.params.id}`, form)
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
          console.log(err)
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
    uploadFile(event) {
      if (event !== null) {
        this.rules = [
          v =>
            !v ||
            v.type === 'image/jpg' ||
            v.type === 'image/jpeg' ||
            v.type === 'image/png' ||
            'Image harus dalam bentuk jpeg, jpg atau png dan size'
        ]
        this.rules2 = [v => !v || v.size < 1000000 || 'Image size min 500kb']
        const self = this
        setTimeout(function() {
          if (self.$refs.entryForm.validate()) {
            const data = new FormData()
            data.append('file', event)
            axios
              .post(`${self.API_LINK}/uploader`, data)
              .then(res => {
                self.showMsgDialog('success', '', false)
                self.file = res.data.data
              })
              .catch(err => {
                self.clear()
                self.showMsgDialog(
                  'error',
                  err
                    ? 'Failed, Please contact an admin!'
                    : 'Failed went wrong, Please contact an admin!',
                  false
                )
              })
          }
        })
      } else {
        this.file = ''
      }
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
.newsImageInput {
  width: 50%;
  height: 100%;
  color: white;
  background-repeat: no-repeat;
  background-size: 100% 100%;
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
  .beritaColumnEditor {
    padding: 0 !important;
  }

  .newsImageInput {
    width: 80%;
    height: 100%;
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

  @media (max-width: 420px) {
    .newsImageInput {
      width: 100%;
      height: 80%;
    }
  }
}
</style>
