const { environment } = require('@rails/webpacker')
const erb = require('./loaders/erb')

// Add the following lines
const webpack = require("webpack")

environment.plugins.append("Provide", new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    Popper: ['popper.js', 'default']  // Not a typo, we're still using popper.js here
}))
// End new addition

environment.loaders.prepend('erb', erb)
module.exports = environment

