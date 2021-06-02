const path = require('path');
const HtmlWebpackPlugin = require('html-webpack-plugin');

module.exports = {
    mode: 'development',
    devtool: 'source-map',
    entry: './build.hxml',
    output: {
      filename: 'main.js',
      path: path.resolve(__dirname, 'bin'),
    },
    module: {
      rules: [
        {
          test: /\.hxml$/,
          loader: 'simple-haxe-loader',
          options: {
            debug: true
          }
        },
        {
          test: /\.glsl$/,
          loader: 'webpack-glsl-loader'
        },
      ]
    },
    plugins: [
      new HtmlWebpackPlugin({
        template: './bin/index.html'
      })
    ],
    devServer: {
        compress: true,
        port: 4444,
        overlay: true,
        hot: true,
        disableHostCheck: true
    }
  }