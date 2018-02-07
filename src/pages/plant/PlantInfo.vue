<template>
<div>
<el-dialog  :title="plant.name" :visible.sync="dialogTableVisible">
    <div class="plname">
            <el-button  type="danger" round>名称</el-button><label>：{{plant.name}}</label>
    </div>
    <br><br><br><br>
    <div class="plshu">
        <div class="plname">
            <el-button  type="primary" round>mu</el-button><label>：{{plant.mu}}</label>
        </div>
        <div class="plname">
            <el-button  type="warning" round>科</el-button><label>：{{plant.ke}}</label>
        </div>
        <div class="plname">
            <el-button  type="success" round>属</el-button><label>：{{plant.shu}}</label>
        </div>
        <div class="plname">
            <el-button  type="primary" round>种</el-button><label>：{{plant.zhong}}</label>
        </div>


    </div>
    <br><br><br>
    <div class="plname">
            <el-button  type="info" round>习性</el-button><label >：{{plant.xixing}}</label>
    </div>
    <div class="plinfo" >
        <p class="siminfo">{{plant.plantinfo}}</p>
        <span/>
        <p class="chandi">{{plant.chandi}}</p>
    </div>
    <div>
        <el-carousel :interval="4000" type="card" height="200px">
            <el-carousel-item v-for="img in imgs" :key="img.id">
                <img class="plinfoimg" :src="img.irc"/>
            </el-carousel-item>
        </el-carousel>
    </div>
</el-dialog>
</div>
</template>
<script>
  export default {
    data () {
      return {
        dialogTableVisible: false,
        imgs: [
            // {id: 1, irc: '/src/assets/rose.jpg'},
            // {id: 2, irc: '/src/assets/rose.jpg'},
            // {id: 3, irc: '/src/assets/rose.jpg'},
            // {id: 4, irc: '/src/assets/rose.jpg'}
        ],
        plant: {
          name: '玫瑰'

        }
      }
    },
    methods: {
      getInfoById: function (id) {
        let self = this

        self.$axios.get('/api/plant/getPlantInfo', { params: { id: id } }).then(function (res) {
          if (res.data.code) {
            self.imgs = []
            self.plant = res.data.data
            var strimg = res.data.data.imgsrc

            var ircs = strimg.split(',')

            // console.log(self.imgs)
            for (let i = 0; i < ircs.length; i++) {
              self.imgs.push({id: i + 1, irc: ircs[i]})
            }
            console.log(self.imgs)
            // sessionStorage.setItem('plant', self.plant)
          }
        })
        // console.log(id)
        self.dialogTableVisible = true
      }
    }

  }
</script>
<style>
.plinfo{
    width:710px;
    min-height:300px;
    margin-top:80px;
    border: solid 1px #bdcfe0;
    word-break: break-word;
}
.el-dialog{
    min-height:300px ;
    /* background: rgb(204, 214, 216); */
}
/* label{
    height:50px;
    background: gray;
} */

.plname{
    border-radius:4px;
    background: rgb(235, 233, 223);
    float: left;
    margin-left: 50px;
    font-size: 18px;

}
.plinfoimg{
    height: 200px;
    width:359px;
}
 .el-carousel__item h3 {
    color: #475669;
    font-size: 14px;
    opacity: 0.75;
    line-height: 200px;
    margin: 0;
  }

  .el-carousel__item:nth-child(2n) {
    background-color: #99a9bf;
  }

  .el-carousel__item:nth-child(2n+1) {
    background-color: #d3dce6;
  }
</style>
