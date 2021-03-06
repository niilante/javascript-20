fs = require('fs')
Promise = require 'bluebird'

openIt = (fileName, num) ->
  new Promise  (resolve, reject) ->
    fs.open fileName, 'w', (err, res) ->
      if (err) then reject(err)
      resolve(res: res, num: num)
    

files = process.argv[2..]

compteur = 0
files.forEach (elem) ->
  compteur++
  fileName = 'tmp/' + elem + '.json'
  openIt(fileName, compteur)
  .then (file) ->
    console.log '-> fichier ouvert', fileName, '=', file.num
