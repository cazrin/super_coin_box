module.exports = function (grunt) {
  require('load-grunt-tasks')(grunt);

  grunt.initConfig({
    clean: {
      assets: ['output/assets'],
      html: ['output/**/*.html'],
      js: ['output/**/*.js']
    },

    coffee: {
      compile: {
        options: {
          sourceMap: true
        },

        files: {
          'output/js/game.coffee.js': ['game/**/*.coffee']
        }
      }
    },

    concat_sourcemap: {
      target: {
        files: {
          'output/js/game.js': [
            'vendor/phaser/phaser.min.js',
            'output/js/game.coffee.js',
          ]
        }
      }
    },

    connect: {
      server: {
        options: {
          base: 'output',
          port: 8000
        }
      }
    },

    copy: {
      assets: {
        files: [
          { expand: true, cwd: 'game', src: ['assets/**/*'], dest: 'output' }
        ]
      },

      html: {
        files: [
          { expand: true, cwd: 'game', src: ['**/*.html'], dest: 'output' }
        ]
      }
    },

    watch: {
      assets: {
        files: ['game/assets/**/*'],
        tasks: ['build:assets']
      },

      js: {
        files: ['game/**/*.coffee'],
        tasks: ['build:js']
      },

      html: {
        files: ['game/**/*.html'],
        tasks: ['build:html']
      }
    }
  });

  grunt.registerTask('build', [
    'build:js',
    'build:assets',
    'build:html'
  ]);

  grunt.registerTask('build:assets', [
    'clean:assets',
    'copy:assets'
  ]);

  grunt.registerTask('build:js', [
    'clean:js',
    'coffee',
    'concat_sourcemap'
  ]);

  grunt.registerTask('build:html', [
    'clean:html',
    'copy:html'
  ]);

  grunt.registerTask('default', [
    'build',
    'connect',
    'watch'
  ]);
};
