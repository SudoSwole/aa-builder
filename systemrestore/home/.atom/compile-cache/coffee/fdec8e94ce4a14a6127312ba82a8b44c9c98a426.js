(function() {
  module.exports = {
    config: {
      fontFamily: {
        description: 'Use one of the fonts available in this package. View the README for descriptions of each.',
        type: 'string',
        "default": 'System Default',
        "enum": ['Cantarell', 'Clear Sans', 'Fira Sans', 'Open Sans', 'Oxygen', 'Roboto', 'Source Sans Pro', 'Ubuntu', 'System Default']
      },
      fontWeight: {
        description: 'Not all fonts come in all weights: Canterell and Oxygen only have regular, Ubuntu and Open Sans don\'t have thin.',
        type: 'string',
        "default": 'Regular',
        "enum": ['Extra light / Thin', 'Light', 'Regular']
      },
      customBackgroundColor: {
        description: 'Choose a custom background color.',
        type: 'boolean',
        "default": false
      },
      customBackgroundColorPicker: {
        description: 'Choose your background color.',
        type: 'color',
        "default": 'white'
      },
      backgroundGradient: {
        description: 'Apply a subtle gradient to the background.',
        type: 'boolean',
        "default": false
      },
      backgroundImage: {
        description: 'Use an image as a background.',
        type: 'boolean',
        "default": false
      },
      backgroundImagePath: {
        description: 'The path to an image from your computer or the internets (e.g. hubblesite.org or unsplash.com).',
        type: 'string',
        "default": 'atom://isotope-ui/resources/images/raket.jpg'
      },
      lowContrastTooltip: {
        description: 'Make tooltips low contrast and not so colorful.',
        type: 'boolean',
        "default": false
      },
      matchEditorFont: {
        description: 'Match the font family you set for the editor.',
        type: 'boolean',
        "default": false
      },
      minimalMode: {
        description: 'Make the layout more minimal.',
        type: 'boolean',
        "default": false
      },
      tabSizing: {
        description: 'In Even mode all tabs will be the same size. Great for quickly closing many tabs. In Minimum mode the tabs will only take as little space as needed and also show longer file names.',
        type: 'string',
        "default": 'Even',
        "enum": ['Even', 'Minimum']
      }
    },
    activate: function(state) {
      return atom.themes.onDidChangeActiveThemes(function() {
        var Config;
        Config = require('./config');
        return Config.apply();
      });
    }
  };

}).call(this);

//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiIiwic291cmNlUm9vdCI6IiIsInNvdXJjZXMiOlsiL2hvbWUvbXh2aWlpLy5hdG9tL3BhY2thZ2VzL2lzb3RvcGUtdWkvbGliL2lzb3RvcGUtdWkuY29mZmVlIl0sIm5hbWVzIjpbXSwibWFwcGluZ3MiOiJBQUFBO0VBQUEsTUFBTSxDQUFDLE9BQVAsR0FFRTtJQUFBLE1BQUEsRUFDRTtNQUFBLFVBQUEsRUFDRTtRQUFBLFdBQUEsRUFBYSwyRkFBYjtRQUVBLElBQUEsRUFBTSxRQUZOO1FBR0EsQ0FBQSxPQUFBLENBQUEsRUFBUyxnQkFIVDtRQUlBLENBQUEsSUFBQSxDQUFBLEVBQU0sQ0FDSixXQURJLEVBRUosWUFGSSxFQUdKLFdBSEksRUFJSixXQUpJLEVBS0osUUFMSSxFQU1KLFFBTkksRUFPSixpQkFQSSxFQVFKLFFBUkksRUFTSixnQkFUSSxDQUpOO09BREY7TUFnQkEsVUFBQSxFQUNFO1FBQUEsV0FBQSxFQUFhLG1IQUFiO1FBRUEsSUFBQSxFQUFNLFFBRk47UUFHQSxDQUFBLE9BQUEsQ0FBQSxFQUFTLFNBSFQ7UUFJQSxDQUFBLElBQUEsQ0FBQSxFQUFNLENBQ0osb0JBREksRUFFSixPQUZJLEVBR0osU0FISSxDQUpOO09BakJGO01BMEJBLHFCQUFBLEVBQ0U7UUFBQSxXQUFBLEVBQWEsbUNBQWI7UUFDQSxJQUFBLEVBQU0sU0FETjtRQUVBLENBQUEsT0FBQSxDQUFBLEVBQVMsS0FGVDtPQTNCRjtNQThCQSwyQkFBQSxFQUNFO1FBQUEsV0FBQSxFQUFhLCtCQUFiO1FBQ0EsSUFBQSxFQUFNLE9BRE47UUFFQSxDQUFBLE9BQUEsQ0FBQSxFQUFTLE9BRlQ7T0EvQkY7TUFrQ0Esa0JBQUEsRUFDRTtRQUFBLFdBQUEsRUFBYSw0Q0FBYjtRQUNBLElBQUEsRUFBTSxTQUROO1FBRUEsQ0FBQSxPQUFBLENBQUEsRUFBUyxLQUZUO09BbkNGO01Bc0NBLGVBQUEsRUFDRTtRQUFBLFdBQUEsRUFBYSwrQkFBYjtRQUNBLElBQUEsRUFBTSxTQUROO1FBRUEsQ0FBQSxPQUFBLENBQUEsRUFBUyxLQUZUO09BdkNGO01BMENBLG1CQUFBLEVBQ0U7UUFBQSxXQUFBLEVBQWEsaUdBQWI7UUFFQSxJQUFBLEVBQU0sUUFGTjtRQUdBLENBQUEsT0FBQSxDQUFBLEVBQVMsOENBSFQ7T0EzQ0Y7TUErQ0Esa0JBQUEsRUFDRTtRQUFBLFdBQUEsRUFBYSxpREFBYjtRQUNBLElBQUEsRUFBTSxTQUROO1FBRUEsQ0FBQSxPQUFBLENBQUEsRUFBUyxLQUZUO09BaERGO01BbURBLGVBQUEsRUFDRTtRQUFBLFdBQUEsRUFBYSwrQ0FBYjtRQUNBLElBQUEsRUFBTSxTQUROO1FBRUEsQ0FBQSxPQUFBLENBQUEsRUFBUyxLQUZUO09BcERGO01BdURBLFdBQUEsRUFDRTtRQUFBLFdBQUEsRUFBYSwrQkFBYjtRQUNBLElBQUEsRUFBTSxTQUROO1FBRUEsQ0FBQSxPQUFBLENBQUEsRUFBUyxLQUZUO09BeERGO01BMkRBLFNBQUEsRUFDRTtRQUFBLFdBQUEsRUFBYSxzTEFBYjtRQUNBLElBQUEsRUFBTSxRQUROO1FBRUEsQ0FBQSxPQUFBLENBQUEsRUFBUyxNQUZUO1FBR0EsQ0FBQSxJQUFBLENBQUEsRUFBTSxDQUNKLE1BREksRUFFSixTQUZJLENBSE47T0E1REY7S0FERjtJQXNFQSxRQUFBLEVBQVUsU0FBQyxLQUFEO2FBRVIsSUFBSSxDQUFDLE1BQU0sQ0FBQyx1QkFBWixDQUFvQyxTQUFBO0FBQ2xDLFlBQUE7UUFBQSxNQUFBLEdBQVMsT0FBQSxDQUFRLFVBQVI7ZUFDVCxNQUFNLENBQUMsS0FBUCxDQUFBO01BRmtDLENBQXBDO0lBRlEsQ0F0RVY7O0FBRkYiLCJzb3VyY2VzQ29udGVudCI6WyJtb2R1bGUuZXhwb3J0cyA9XG5cbiAgY29uZmlnOlxuICAgIGZvbnRGYW1pbHk6XG4gICAgICBkZXNjcmlwdGlvbjogJ1VzZSBvbmUgb2YgdGhlIGZvbnRzIGF2YWlsYWJsZSBpbiB0aGlzIHBhY2thZ2UuXG4gICAgICAgIFZpZXcgdGhlIFJFQURNRSBmb3IgZGVzY3JpcHRpb25zIG9mIGVhY2guJ1xuICAgICAgdHlwZTogJ3N0cmluZydcbiAgICAgIGRlZmF1bHQ6ICdTeXN0ZW0gRGVmYXVsdCdcbiAgICAgIGVudW06IFtcbiAgICAgICAgJ0NhbnRhcmVsbCcsXG4gICAgICAgICdDbGVhciBTYW5zJyxcbiAgICAgICAgJ0ZpcmEgU2FucycsXG4gICAgICAgICdPcGVuIFNhbnMnLFxuICAgICAgICAnT3h5Z2VuJyxcbiAgICAgICAgJ1JvYm90bycsXG4gICAgICAgICdTb3VyY2UgU2FucyBQcm8nLFxuICAgICAgICAnVWJ1bnR1JyxcbiAgICAgICAgJ1N5c3RlbSBEZWZhdWx0J1xuICAgICAgXVxuICAgIGZvbnRXZWlnaHQ6XG4gICAgICBkZXNjcmlwdGlvbjogJ05vdCBhbGwgZm9udHMgY29tZSBpbiBhbGwgd2VpZ2h0czogQ2FudGVyZWxsIGFuZCBPeHlnZW5cbiAgICAgICAgb25seSBoYXZlIHJlZ3VsYXIsIFVidW50dSBhbmQgT3BlbiBTYW5zIGRvblxcJ3QgaGF2ZSB0aGluLidcbiAgICAgIHR5cGU6ICdzdHJpbmcnXG4gICAgICBkZWZhdWx0OiAnUmVndWxhcidcbiAgICAgIGVudW06IFtcbiAgICAgICAgJ0V4dHJhIGxpZ2h0IC8gVGhpbicsXG4gICAgICAgICdMaWdodCcsXG4gICAgICAgICdSZWd1bGFyJ1xuICAgICAgXVxuICAgIGN1c3RvbUJhY2tncm91bmRDb2xvcjpcbiAgICAgIGRlc2NyaXB0aW9uOiAnQ2hvb3NlIGEgY3VzdG9tIGJhY2tncm91bmQgY29sb3IuJ1xuICAgICAgdHlwZTogJ2Jvb2xlYW4nXG4gICAgICBkZWZhdWx0OiBmYWxzZVxuICAgIGN1c3RvbUJhY2tncm91bmRDb2xvclBpY2tlcjpcbiAgICAgIGRlc2NyaXB0aW9uOiAnQ2hvb3NlIHlvdXIgYmFja2dyb3VuZCBjb2xvci4nXG4gICAgICB0eXBlOiAnY29sb3InXG4gICAgICBkZWZhdWx0OiAnd2hpdGUnXG4gICAgYmFja2dyb3VuZEdyYWRpZW50OlxuICAgICAgZGVzY3JpcHRpb246ICdBcHBseSBhIHN1YnRsZSBncmFkaWVudCB0byB0aGUgYmFja2dyb3VuZC4nXG4gICAgICB0eXBlOiAnYm9vbGVhbidcbiAgICAgIGRlZmF1bHQ6IGZhbHNlXG4gICAgYmFja2dyb3VuZEltYWdlOlxuICAgICAgZGVzY3JpcHRpb246ICdVc2UgYW4gaW1hZ2UgYXMgYSBiYWNrZ3JvdW5kLidcbiAgICAgIHR5cGU6ICdib29sZWFuJ1xuICAgICAgZGVmYXVsdDogZmFsc2VcbiAgICBiYWNrZ3JvdW5kSW1hZ2VQYXRoOlxuICAgICAgZGVzY3JpcHRpb246ICdUaGUgcGF0aCB0byBhbiBpbWFnZSBmcm9tIHlvdXIgY29tcHV0ZXIgb3JcbiAgICAgICB0aGUgaW50ZXJuZXRzIChlLmcuIGh1YmJsZXNpdGUub3JnIG9yIHVuc3BsYXNoLmNvbSkuJ1xuICAgICAgdHlwZTogJ3N0cmluZydcbiAgICAgIGRlZmF1bHQ6ICdhdG9tOi8vaXNvdG9wZS11aS9yZXNvdXJjZXMvaW1hZ2VzL3Jha2V0LmpwZydcbiAgICBsb3dDb250cmFzdFRvb2x0aXA6XG4gICAgICBkZXNjcmlwdGlvbjogJ01ha2UgdG9vbHRpcHMgbG93IGNvbnRyYXN0IGFuZCBub3Qgc28gY29sb3JmdWwuJ1xuICAgICAgdHlwZTogJ2Jvb2xlYW4nXG4gICAgICBkZWZhdWx0OiBmYWxzZVxuICAgIG1hdGNoRWRpdG9yRm9udDpcbiAgICAgIGRlc2NyaXB0aW9uOiAnTWF0Y2ggdGhlIGZvbnQgZmFtaWx5IHlvdSBzZXQgZm9yIHRoZSBlZGl0b3IuJ1xuICAgICAgdHlwZTogJ2Jvb2xlYW4nXG4gICAgICBkZWZhdWx0OiBmYWxzZVxuICAgIG1pbmltYWxNb2RlOlxuICAgICAgZGVzY3JpcHRpb246ICdNYWtlIHRoZSBsYXlvdXQgbW9yZSBtaW5pbWFsLidcbiAgICAgIHR5cGU6ICdib29sZWFuJ1xuICAgICAgZGVmYXVsdDogZmFsc2VcbiAgICB0YWJTaXppbmc6XG4gICAgICBkZXNjcmlwdGlvbjogJ0luIEV2ZW4gbW9kZSBhbGwgdGFicyB3aWxsIGJlIHRoZSBzYW1lIHNpemUuIEdyZWF0IGZvciBxdWlja2x5IGNsb3NpbmcgbWFueSB0YWJzLiBJbiBNaW5pbXVtIG1vZGUgdGhlIHRhYnMgd2lsbCBvbmx5IHRha2UgYXMgbGl0dGxlIHNwYWNlIGFzIG5lZWRlZCBhbmQgYWxzbyBzaG93IGxvbmdlciBmaWxlIG5hbWVzLidcbiAgICAgIHR5cGU6ICdzdHJpbmcnXG4gICAgICBkZWZhdWx0OiAnRXZlbidcbiAgICAgIGVudW06IFtcbiAgICAgICAgJ0V2ZW4nLFxuICAgICAgICAnTWluaW11bSdcbiAgICAgIF1cblxuXG4gIGFjdGl2YXRlOiAoc3RhdGUpIC0+XG4gICAgIyBjb2RlIGluIHNlcGFyYXRlIGZpbGUgc28gZGVmZXJyYWwga2VlcHMgYWN0aXZhdGlvbiB0aW1lIGRvd25cbiAgICBhdG9tLnRoZW1lcy5vbkRpZENoYW5nZUFjdGl2ZVRoZW1lcyAtPlxuICAgICAgQ29uZmlnID0gcmVxdWlyZSAnLi9jb25maWcnXG4gICAgICBDb25maWcuYXBwbHkoKVxuIl19
