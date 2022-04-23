<template>
  <div class="text-center">
    <v-dialog v-model="dialog" max-width="650px" @click:outside="clickOutside">
      <template v-slot:activator="{ on, attrs }">
        <p id="galleryUpload" v-bind="attrs" v-on="on"></p>
      </template>
      <div>
        <v-container
          style="max-width:100%;background: white; border-radius: 5px"
        >
          <v-form
            @submit.prevent="submit"
            ref="entryForm"
            style="position: relative"
          >
            <v-card
              flat
              style="
                z-index: 2;
                position: sticky;
                top: 0;
                background: white;
                border-bottom: 1px solid black;
                margin-bottom: 10px;
                display: flex;
                justify-content: space-between;
              "
            >
              <div
                style="
                  display: flex;
                  jsutify-content: center;
                  align-items: center;
                  margin-left: 10px;
                "
              >
                <v-toolbar-title class="overline"
                  ><p style="font-size: 20px; margin: 0; font-weight: bold">
                    Upload Foto
                  </p>
                </v-toolbar-title>
              </div>
              <div>
                <v-btn
                  x-small
                  tile
                  color="pink"
                  class="ma-2"
                  style="color: white"
                  @click="close"
                  :loading="loading"
                >
                  tutup
                </v-btn>
              </div>
            </v-card>

            <v-row no-gutters style="padding: 15px">
              <v-col md="12" style="padding: 0">
                <div style="padding: 0 10px">
                  <v-col cols="12" style="padding: 0">
                    <v-file-input
                      @change="uploadFile"
                      v-model="fileData"
                      clear-icon="mdi-close"
                      color="deep-green accent-4"
                      counter
                      label="File input"
                      placeholder="Select your files"
                      prepend-icon=""
                      append-icon="mdi-attachment"
                      outlined
                      :show-size="1000"
                      :rules="rules.concat(rules2)"
                      dense
                      accept="image/png, image/jpeg, image/jpg"
                    >
                      <!-- <template v-slot:selection="{ index, text }">
                        <v-chip v-if="index < 4" dark label small>
                          {{ text }}
                        </v-chip>

                        <span
                          v-else-if="index === 4"
                          class="text-overline grey--text text--darken-3 mx-2"
                        >
                          +{{ files.length - 4 }} File(s)
                        </span>
                      </template> -->
                    </v-file-input>
                  </v-col>
                  <v-col cols="12" style="padding: 0">
                    <v-textarea
                      auto-grow
                      v-model="caption"
                      label="caption"
                      outlined
                    ></v-textarea>
                  </v-col>
                </div>
              </v-col>
              <v-col
                md="12"
                class="d-flex align-end"
                style="padding: 0 10px;min-height:150px;"
              >
                <v-btn
                  :disabled="files === null"
                  type="submit"
                  tile
                  color="#06125c"
                  style="color: white; width:100%; font-size:22px;"
                  :loading="loading"
                >
                  Submit
                </v-btn></v-col
              >
            </v-row>
          </v-form>
        </v-container>
      </div>
    </v-dialog>
  </div>
</template>
<script>
import axios from 'axios'
import buildType from '../../../services/buildType'
export default {
  data() {
    return {
      API_LINK: buildType.apiURL('domain'),
      dialog: false,
      loading: false,
      // rules: [
      //   value =>
      //     !value ||
      //     value.size < 1000000 ||
      //     'Image size should be less than 1 MB!' ||
      //     value.type !== 'image/jpg'
      // ],
      rules: [],
      rules2: [],
      files: null,
      fileData: null,
      caption: ''
    }
  },
  watch: {},
  computed: {},
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
        this.rules2 = [v => !v || v.size < 1000000 || 'Image size min 1MB']
        const self = this
        setTimeout(function() {
          if (self.$refs.entryForm.validate()) {
            const data = new FormData()
            data.append('file', event)
            axios
              .post(`${self.API_LINK}uploader`, data)
              .then(res => {
                self.showMsgDialog('success', '', false)
                self.files = res.data.data
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
      }
      // if (event !== null) {
      // } else {
      //   this.files = null
      // }
    },
    close() {
      this.clear()
      this.dialog = false
    },
    clear() {
      this.files = null
      this.fileData = null
      this.caption = ''
    },
    clickOutside() {
      this.close()
    },
    submit() {
      if (this.files !== null) {
        this.loading = true

        const self = this
        setTimeout(function() {
          if (self.$refs.entryForm.validate()) {
            self.createNewForm(self.form)
          }
        })
      }
    },
    createNewForm() {
      const newForm = {
        caption: this.caption,
        file: this.files
      }
      this.save(newForm)
    },
    save(form) {
      this.showMsgDialog('question', 'Simpan', true).then(res => {
        if (res.value) {
          axios
            .post(`${this.API_LINK}dokumentasi`, form)
            .then(res => {
              this.loading = false
              if (res.data.status === 200) {
                this.showMsgDialog('success', res.data.msg, false)
                this.$emit('loadImage')
                this.close()
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
        } else {
          this.loading = false
        }
      })
    }
  }
}
</script>
<style lang="scss" scoped></style>
