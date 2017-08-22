const path = require("path");
const webpack = require("webpack");
const ExtractTextPlugin = require("extract-text-webpack-plugin");

module.exports = {
	entry: {
		styles: "bootstrap-loader",
	},
	output: {
		filename: "[name].[chunkhash].js",
		path: path.resolve(__dirname, "dist"),
	},
	module: {
		rules: [
			{
				test: /\.ttf$/,
				use: {
					loader: "file-loader",
					options: {
						name: "[name].[hash].[ext]",
					},
				},
			},
		],
	},
	plugins: [
		new ExtractTextPlugin("[name].[contenthash].css"),
	],
};
