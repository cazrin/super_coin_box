module.exports = function (grunt) {
  require('load-grunt-tasks')(grunt);

  grunt.initConfig({
    clean: {
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
      html: {
        files: [
          { expand: true, cwd: 'game', src: ['**/*.html'], dest: 'output' }
        ]
      }
    },

    watch: {
      js: {
        files: ['game/**/*.js'],
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
    'build:html'
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
