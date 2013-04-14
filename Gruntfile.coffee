module.exports = (grunt) ->
	grunt.loadNpmTasks 'grunt-contrib'
	#	grunt.loadNpmTasks 'grunt-html'
	grunt.loadNpmTasks 'grunt-templater'
	grunt.loadNpmTasks 'grunt-ftp-deploy'

	HOST_NAME = '192.168.11.30'
	PORT = 33334

	{config} = require './src/config/config.coffee'


	getFiles = (srcdir, destdir, wildcard) ->
		path = require("path")
		files = {}
		grunt.file.expand(
			cwd: srcdir
		, wildcard).forEach (relpath) ->
			files[path.join(destdir, relpath)] = path.join(srcdir, relpath)

		return files



	grunt.initConfig(
		concat:
			'www/common/js/lib.js': [
				'src/js/vendors/jquery/jquery.min.js'
				'src/js/vendors/jquery.transit/site/jquery.transit-0.9.9.min.js'
				'src/js/vendors/jquery-easing/jquery.easing.min.js'
				'src/js/vendors/underscore/underscore-min.js'
				'src/js/vendors/backbone/backbone-min.js'
			]


		watch:
			jade:
				files: [ 'src/jade/**/*.jade' ]
				tasks: ['html']
			less:
				files: [ 'src/less/**/*.less' ]
				tasks: ['css']
			coffee:
				files: [ 'src/**/*.coffee' ]
				tasks: ['js']
			dev:
				files: [
					'src/**/*.coffee'
					'src/less/**/*.less'
					'src/jade/**/*.jade'
				]
				tasks: ['dev']


		cssmin:
			compress:
				files:
					'www/common/css/common.min.css': ['build_tmp/css/common.css']

		uglify:
			all:
				src: ['www/common/js/all.js']
				dest: 'www/common/js/all.min.js'

		less:
			dev:
				options:
					paths: ['src/less']
				files:
					'build_tmp/css/common.css': 'src/less/common.less'
			production:
				options:
					paths: ['src/less']
					compress: true
				files:
					'build_tmp/css/common.css': 'src/less/common.less'
		coffee:
			compile:
				files:
					'build_tmp/js/all.js': ['src/coffee/**/*.coffee']
			dev:
				options:
					bare: false
					join: true

				files:
					'www/common/js/all.js': [
						'src/coffee/Log.coffee'
						'src/coffee/util.UA.coffee'
						'src/coffee/Util.coffee'
						'src/coffee/Main.coffee'
					]

			multiple:
				options:
					bare: true
				expand: true,
				cwd: 'src/coffee',
				src: ['**/*.coffee'],
				dest: 'build_tmp/js/',
				ext: '.js'


		jade:
			dev:
				options:
					pretty: true
					data: config.getData(config.develop)

				files: [ 'www/index.html': 'src/jade/index.jade' ]
			production:
				options:
					pretty: true
					data: config.getData(config.production)

				files: [ 'www/index.html': 'src/jade/index.jade' ]


		copy:
			jsLib:
				files: [
					{expand: true, cwd: 'src/js/vendors/html5shiv/dist/', src: ['html5shiv.js'], dest: 'www/common/js/'}
				]
		clean:
			build:
				src: ['www/img/**']

		htmllint:
			all: ['www/**/*.html']


		connect:
			dev:
				options:
					hostname: HOST_NAME
					port: PORT
					base: 'www'
					keepalive: true



	)
#	grunt.registerTask 'default', ['coffee', 'template', 'less:development', 'concat', 'mincss', 'uglify:all', 'copy']
	grunt.registerTask 'all', ['template', 'less:dev', 'cssmin']
	grunt.registerTask 'dev', ['jade:dev', 'coffee:dev', 'concat', 'less:dev', 'cssmin']
	grunt.registerTask 'html', ['jade:dev']
	grunt.registerTask 'css', ['less:dev', 'cssmin']
	grunt.registerTask 'js', ['coffee:dev']
	grunt.registerTask 'w', ['dev']







	return