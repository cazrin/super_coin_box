module.exports = function (grunt) {
  require('load-grunt-tasks')(grunt);

  grunt.initConfig({
    clean: {
      html: ['output/**/*.html'],
      js: ['output/**/*.js']
    },

    concat_sourcemap: {
      target: {
        files: {
          'output/js/game.js': [
            'vendor/phaser/phaser.min.js',
            'game/**/*.js',
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
