<template>
	<view class="home_category">
		<navigator class="cate_item" v-for="item in category" :key="item.id" :url="`/pages/imgCategory/imgCategory?id=${item.id}`">
			<image :src="item.cover" mode="aspectFill"></image>
			<view class="cate_name">
				{{item.name}}
			</view>
		</navigator>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				category:[]
			}
		},
		methods: {
			getList(){
				this.require({
					url:"http://157.122.54.189:9088/image/v1/vertical/category"
				}).then(result=>{
					this.category=result.res.category;
				});
			}
		},
		mounted() {
			uni.setNavigationBarTitle({
				title:"分类"
			});
			this.getList();
		}
	}
</script>

<style lang="less">
	.home_category{
		display: flex;
		flex-wrap: wrap;
		.cate_item{
			width: 33.33%;
			position: relative;
			border-bottom: 5rpx solid #fff;
			image{
				height: 240rpx;
			}
			.cate_name{
				position: absolute;
				width: 100%;
				height: 50rpx;
				left: 0;
				bottom: 0;
				color: #fff;
				background-image: linear-gradient(to right top,rgba(0,0,0,.2),rgba(0,0,0,0));
				font-size: 40rpx;
				display: flex;
				align-items: center;
				padding-left: 20rpx;
			}
		}
	}
</style>
