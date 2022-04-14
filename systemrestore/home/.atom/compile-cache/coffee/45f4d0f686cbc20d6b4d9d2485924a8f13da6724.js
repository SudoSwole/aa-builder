(function() {
  module.exports = {
    apply: function() {
      var applyBackgroundColor, applyBackgroundGradient, applyBackgroundImage, applyEditorFont, applyFont, applyFontWeight, applyMinimalMode, applyTabSizing, applyTooltipContrast, body;
      body = document.querySelector('body');
      applyFont = function(font) {
        return body.setAttribute('data-isotope-ui-font', font);
      };
      applyFontWeight = function(weight) {
        return body.setAttribute('data-isotope-ui-fontweight', weight);
      };
      applyBackgroundColor = function() {
        if (atom.config.get('isotope-ui.customBackgroundColor')) {
          atom.config.set('isotope-ui.backgroundImage', 'false');
          atom.config.set('isotope-ui.backgroundGradient', 'false');
          body.setAttribute('data-isotope-ui-bg-color', 'true');
          return body.style.backgroundColor = atom.config.get('isotope-ui.customBackgroundColorPicker').toHexString();
        } else {
          body.setAttribute('data-isotope-ui-bg-color', 'false');
          return body.style.backgroundColor = '';
        }
      };
      applyBackgroundGradient = function() {
        if (atom.config.get('isotope-ui.backgroundGradient')) {
          atom.config.set('isotope-ui.backgroundImage', 'false');
          atom.config.set('isotope-ui.customBackgroundColor', 'false');
          return body.setAttribute('data-isotope-ui-bg-gradient', 'true');
        } else {
          return body.setAttribute('data-isotope-ui-bg-gradient', 'false');
        }
      };
      applyBackgroundImage = function() {
        if (atom.config.get('isotope-ui.backgroundImage')) {
          atom.config.set('isotope-ui.customBackgroundColor', 'false');
          atom.config.set('isotope-ui.customBackgroundColor', 'false');
          atom.config.set('isotope-ui.backgroundGradient', 'false');
          body.setAttribute('data-isotope-ui-bg-image', 'true');
          return body.style.backgroundImage = 'url(' + atom.config.get('isotope-ui.backgroundImagePath') + ')';
        } else {
          body.setAttribute('data-isotope-ui-bg-image', 'false');
          return body.style.backgroundImage = '';
        }
      };
      applyTooltipContrast = function() {
        if (atom.config.get('isotope-ui.lowContrastTooltip')) {
          return body.setAttribute('data-isotope-ui-tooltip-lowcontrast', 'true');
        } else {
          return body.setAttribute('data-isotope-ui-tooltip-lowcontrast', 'false');
        }
      };
      applyEditorFont = function() {
        if (atom.config.get('isotope-ui.matchEditorFont')) {
          if (atom.config.get('editor.fontFamily') === '') {
            return body.style.fontFamily = 'Inconsolata, Monaco, Consolas, "Courier New", Courier';
          } else {
            return body.style.fontFamily = atom.config.get('editor.fontFamily');
          }
        } else {
          return body.style.fontFamily = '';
        }
      };
      applyMinimalMode = function() {
        if (atom.config.get('isotope-ui.minimalMode')) {
          return body.setAttribute('data-isotope-ui-minimal', 'true');
        } else {
          return body.setAttribute('data-isotope-ui-minimal', 'false');
        }
      };
      applyTabSizing = function() {
        return body.setAttribute('data-isotope-ui-tabsizing', atom.config.get('isotope-ui.tabSizing').toLowerCase());
      };
      applyFont(atom.config.get('isotope-ui.fontFamily'));
      applyFontWeight(atom.config.get('isotope-ui.fontWeight'));
      applyBackgroundGradient();
      applyBackgroundImage();
      applyBackgroundColor();
      applyTooltipContrast();
      applyEditorFont();
      applyMinimalMode();
      applyTabSizing();
      atom.config.onDidChange('isotope-ui.fontFamily', function() {
        return applyFont(atom.config.get('isotope-ui.fontFamily'));
      });
      atom.config.onDidChange('isotope-ui.fontWeight', function() {
        return applyFontWeight(atom.config.get('isotope-ui.fontWeight'));
      });
      atom.config.onDidChange('isotope-ui.customBackgroundColor', function() {
        return applyBackgroundColor();
      });
      atom.config.onDidChange('isotope-ui.customBackgroundColorPicker', function() {
        return applyBackgroundColor();
      });
      atom.config.onDidChange('isotope-ui.backgroundGradient', function() {
        return applyBackgroundGradient();
      });
      atom.config.onDidChange('isotope-ui.backgroundImage', function() {
        return applyBackgroundImage();
      });
      atom.config.onDidChange('isotope-ui.backgroundImagePath', function() {
        return applyBackgroundImage();
      });
      atom.config.onDidChange('isotope-ui.lowContrastTooltip', function() {
        return applyTooltipContrast();
      });
      atom.config.onDidChange('isotope-ui.matchEditorFont', function() {
        return applyEditorFont();
      });
      atom.config.onDidChange('isotope-ui.minimalMode', function() {
        return applyMinimalMode();
      });
      atom.config.onDidChange('editor.fontFamily', function() {
        return applyEditorFont();
      });
      return atom.config.onDidChange('isotope-ui.tabSizing', function() {
        return applyTabSizing();
      });
    }
  };

}).call(this);

//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiIiwic291cmNlUm9vdCI6IiIsInNvdXJjZXMiOlsiL2hvbWUvbXh2aWlpLy5hdG9tL3BhY2thZ2VzL2lzb3RvcGUtdWkvbGliL2NvbmZpZy5jb2ZmZWUiXSwibmFtZXMiOltdLCJtYXBwaW5ncyI6IkFBQUE7RUFBQSxNQUFNLENBQUMsT0FBUCxHQUVFO0lBQUEsS0FBQSxFQUFPLFNBQUE7QUFFTCxVQUFBO01BQUEsSUFBQSxHQUFPLFFBQVEsQ0FBQyxhQUFULENBQXVCLE1BQXZCO01BS1AsU0FBQSxHQUFZLFNBQUMsSUFBRDtlQUNWLElBQUksQ0FBQyxZQUFMLENBQWtCLHNCQUFsQixFQUEwQyxJQUExQztNQURVO01BR1osZUFBQSxHQUFrQixTQUFDLE1BQUQ7ZUFDaEIsSUFBSSxDQUFDLFlBQUwsQ0FBa0IsNEJBQWxCLEVBQWdELE1BQWhEO01BRGdCO01BR2xCLG9CQUFBLEdBQXVCLFNBQUE7UUFDckIsSUFBRyxJQUFJLENBQUMsTUFBTSxDQUFDLEdBQVosQ0FBZ0Isa0NBQWhCLENBQUg7VUFDRSxJQUFJLENBQUMsTUFBTSxDQUFDLEdBQVosQ0FBZ0IsNEJBQWhCLEVBQThDLE9BQTlDO1VBQ0EsSUFBSSxDQUFDLE1BQU0sQ0FBQyxHQUFaLENBQWdCLCtCQUFoQixFQUFpRCxPQUFqRDtVQUNBLElBQUksQ0FBQyxZQUFMLENBQWtCLDBCQUFsQixFQUE4QyxNQUE5QztpQkFDQSxJQUFJLENBQUMsS0FBSyxDQUFDLGVBQVgsR0FBNkIsSUFBSSxDQUFDLE1BQU0sQ0FBQyxHQUFaLENBQWdCLHdDQUFoQixDQUF5RCxDQUFDLFdBQTFELENBQUEsRUFKL0I7U0FBQSxNQUFBO1VBTUUsSUFBSSxDQUFDLFlBQUwsQ0FBa0IsMEJBQWxCLEVBQThDLE9BQTlDO2lCQUNBLElBQUksQ0FBQyxLQUFLLENBQUMsZUFBWCxHQUE2QixHQVAvQjs7TUFEcUI7TUFVdkIsdUJBQUEsR0FBMEIsU0FBQTtRQUN4QixJQUFHLElBQUksQ0FBQyxNQUFNLENBQUMsR0FBWixDQUFnQiwrQkFBaEIs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RCxTQUFBO2VBQ2hELGdCQUFBLENBQUE7TUFEZ0QsQ0FBbEQ7TUFHQSxJQUFJLENBQUMsTUFBTSxDQUFDLFdBQVosQ0FBd0IsbUJBQXhCLEVBQTZDLFNBQUE7ZUFDM0MsZUFBQSxDQUFBO01BRDJDLENBQTdDO2FBR0EsSUFBSSxDQUFDLE1BQU0sQ0FBQyxXQUFaLENBQXdCLHNCQUF4QixFQUFnRCxTQUFBO2VBQzlDLGNBQUEsQ0FBQTtNQUQ4QyxDQUFoRDtJQXBISyxDQUFQOztBQUZGIiwic291cmNlc0NvbnRlbnQiOlsibW9kdWxlLmV4cG9ydHMgPVxuXG4gIGFwcGx5OiAoKSAtPlxuXG4gICAgYm9keSA9IGRvY3VtZW50LnF1ZXJ5U2VsZWN0b3IoJ2JvZHknKVxuXG5cbiAgICAjIGZ1bmN0aW9uc1xuXG4gICAgYXBwbHlGb250ID0gKGZvbnQpIC0+XG4gICAgICBib2R5LnNldEF0dHJpYnV0ZSgnZGF0YS1pc290b3BlLXVpLWZvbnQnLCBmb250KVxuXG4gICAgYXBwbHlGb250V2VpZ2h0ID0gKHdlaWdodCkgLT5cbiAgICAgIGJvZHkuc2V0QXR0cmlidXRlKCdkYXRhLWlzb3RvcGUtdWktZm9udHdlaWdodCcsIHdlaWdodClcblxuICAgIGFwcGx5QmFja2dyb3VuZENvbG9yID0gKCkgLT5cbiAgICAgIGlmIGF0b20uY29uZmlnLmdldCgnaXNvdG9wZS11aS5jdXN0b21CYWNrZ3JvdW5kQ29sb3InKVxuICAgICAgICBhdG9tLmNvbmZpZy5zZXQoJ2lzb3RvcGUtdWkuYmFja2dyb3VuZEltYWdlJywgJ2ZhbHNlJylcbiAgICAgICAgYXRvbS5jb25maWcuc2V0KCdpc290b3BlLXVpLmJhY2tncm91bmRHcmFkaWVudCcsICdmYWxzZScpXG4gICAgICAgIGJvZHkuc2V0QXR0cmlidXRlKCdkYXRhLWlzb3RvcGUtdWktYmctY29sb3InLCAndHJ1ZScpXG4gICAgICAgIGJvZHkuc3R5bGUuYmFja2dyb3VuZENvbG9yID0gYXRvbS5jb25maWcuZ2V0KCdpc290b3BlLXVpLmN1c3RvbUJhY2tncm91bmRDb2xvclBpY2tlcicpLnRvSGV4U3RyaW5nKClcbiAgICAgIGVsc2VcbiAgICAgICAgYm9keS5zZXRBdHRyaWJ1dGUoJ2RhdGEtaXNvdG9wZS11aS1iZy1jb2xvcicsICdmYWxzZScpXG4gICAgICAgIGJvZHkuc3R5bGUuYmFja2dyb3VuZENvbG9yID0gJydcblxuICAgIGFwcGx5QmFja2dyb3VuZEdyYWRpZW50ID0gKCkgLT5cbiAgICAgIGlmIGF0b20uY29uZmlnLmdldCgnaXNvdG9wZS11aS5iYWNrZ3JvdW5kR3JhZGllbnQnKVxuICAgICAgICBhdG9tLmNvbmZpZy5zZXQoJ2lzb3RvcGUtdWkuYmFja2dyb3VuZEltYWdlJywgJ2ZhbHNlJylcbiAgICAgICAgYXRvbS5jb25maWcuc2V0KCdpc290b3BlLXVpLmN1c3RvbUJhY2tncm91bmRDb2xvcicsICdmYWxzZScpXG4gICAgICAgIGJvZHkuc2V0QXR0cmlidXRlKCdkYXRhLWlzb3RvcGUtdWktYmctZ3JhZGllbnQnLCAndHJ1ZScpXG4gICAgICBlbHNlXG4gICAgICAgIGJvZHkuc2V0QXR0cmlidXRlKCdkYXRhLWlzb3RvcGUtdWktYmctZ3JhZGllbnQnLCAnZmFsc2UnKVxuXG4gICAgYXBwbHlCYWNrZ3JvdW5kSW1hZ2UgPSAoKSAtPlxuICAgICAgaWYgYXRvbS5jb25maWcuZ2V0KCdpc290b3BlLXVpLmJhY2tncm91bmRJbWFnZScpXG4gICAgICAgIGF0b20uY29uZmlnLnNldCgnaXNvdG9wZS11aS5jdXN0b21CYWNrZ3JvdW5kQ29sb3InLCAnZmFsc2UnKVxuICAgICAgICBhdG9tLmNvbmZpZy5zZXQoJ2lzb3RvcGUtdWkuY3VzdG9tQmFja2dyb3VuZENvbG9yJywgJ2ZhbHNlJylcbiAgICAgICAgYXRvbS5jb25maWcuc2V0KCdpc290b3BlLXVpLmJhY2tncm91bmRHcmFkaWVudCcsICdmYWxzZScpXG4gICAgICAgIGJvZHkuc2V0QXR0cmlidXRlKCdkYXRhLWlzb3RvcGUtdWktYmctaW1hZ2UnLCAndHJ1ZScpXG4gICAgICAgIGJvZHkuc3R5bGUuYmFja2dyb3VuZEltYWdlID1cbiAgICAgICAgICAndXJsKCcgKyBhdG9tLmNvbmZpZy5nZXQoJ2lzb3RvcGUtdWkuYmFja2dyb3VuZEltYWdlUGF0aCcpICsgJyknXG4gICAgICBlbHNlXG4gICAgICAgIGJvZHkuc2V0QXR0cmlidXRlKCdkYXRhLWlzb3RvcGUtdWktYmctaW1hZ2UnLCAnZmFsc2UnKVxuICAgICAgICBib2R5LnN0eWxlLmJhY2tncm91bmRJbWFnZSA9ICcnXG5cbiAgICBhcHBseVRvb2x0aXBDb250cmFzdCA9ICgpIC0+XG4gICAgICBpZiBhdG9tLmNvbmZpZy5nZXQoJ2lzb3RvcGUtdWkubG93Q29udHJhc3RUb29sdGlwJylcbiAgICAgICAgYm9keS5zZXRBdHRyaWJ1dGUoJ2RhdGEtaXNvdG9wZS11aS10b29sdGlwLWxvd2NvbnRyYXN0JywgJ3RydWUnKVxuICAgICAgZWxzZVxuICAgICAgICBib2R5LnNldEF0dHJpYnV0ZSgnZGF0YS1pc290b3BlLXVpLXRvb2x0aXAtbG93Y29udHJhc3QnLCAnZmFsc2UnKVxuXG4gICAgYXBwbHlFZGl0b3JGb250ID0gKCkgLT5cbiAgICAgIGlmIGF0b20uY29uZmlnLmdldCgnaXNvdG9wZS11aS5tYXRjaEVkaXRvckZvbnQnKVxuICAgICAgICBpZiBhdG9tLmNvbmZpZy5nZXQoJ2VkaXRvci5mb250RmFtaWx5JykgaXMgJydcbiAgICAgICAgICBib2R5LnN0eWxlLmZvbnRGYW1pbHkgPSAnSW5jb25zb2xhdGEsIE1vbmFjbywgQ29uc29sYXMsIFwiQ291cmllciBOZXdcIiwgQ291cmllcidcbiAgICAgICAgZWxzZVxuICAgICAgICAgIGJvZHkuc3R5bGUuZm9udEZhbWlseSA9IGF0b20uY29uZmlnLmdldCgnZWRpdG9yLmZvbnRGYW1pbHknKVxuICAgICAgZWxzZVxuICAgICAgICBib2R5LnN0eWxlLmZvbnRGYW1pbHkgPSAnJ1xuXG4gICAgYXBwbHlNaW5pbWFsTW9kZSA9ICgpIC0+XG4gICAgICBpZiBhdG9tLmNvbmZpZy5nZXQoJ2lzb3RvcGUtdWkubWluaW1hbE1vZGUnKVxuICAgICAgICBib2R5LnNldEF0dHJpYnV0ZSgnZGF0YS1pc290b3BlLXVpLW1pbmltYWwnLCAndHJ1ZScpXG4gICAgICBlbHNlXG4gICAgICAgIGJvZHkuc2V0QXR0cmlidXRlKCdkYXRhLWlzb3RvcGUtdWktbWluaW1hbCcsICdmYWxzZScpXG5cbiAgICBhcHBseVRhYlNpemluZyA9ICgpIC0+XG4gICAgICBib2R5LnNldEF0dHJpYnV0ZSgnZGF0YS1pc290b3BlLXVpLXRhYnNpemluZycsIGF0b20uY29uZmlnLmdldCgnaXNvdG9wZS11aS50YWJTaXppbmcnKS50b0xvd2VyQ2FzZSgpKVxuXG5cbiAgICAjIHJ1biB3aGVuIGF0b20gaXMgcmVhZHlcblxuICAgIGFwcGx5Rm9udChhdG9tLmNvbmZpZy5nZXQoJ2lzb3RvcGUtdWkuZm9udEZhbWlseScpKVxuICAgIGFwcGx5Rm9udFdlaWdodChhdG9tLmNvbmZpZy5nZXQoJ2lzb3RvcGUtdWkuZm9udFdlaWdodCcpKVxuICAgIGFwcGx5QmFja2dyb3VuZEdyYWRpZW50KClcbiAgICBhcHBseUJhY2tncm91bmRJbWFnZSgpXG4gICAgYXBwbHlCYWNrZ3JvdW5kQ29sb3IoKVxuICAgIGFwcGx5VG9vbHRpcENvbnRyYXN0KClcbiAgICBhcHBseUVkaXRvckZvbnQoKVxuICAgIGFwcGx5TWluaW1hbE1vZGUoKVxuICAgIGFwcGx5VGFiU2l6aW5nKClcblxuXG4gICAgIyBydW4gd2hlbiBjb25maWdzIGNoYW5nZVxuXG4gICAgYXRvbS5jb25maWcub25EaWRDaGFuZ2UgJ2lzb3RvcGUtdWkuZm9udEZhbWlseScsIC0+XG4gICAgICBhcHBseUZvbnQoYXRvbS5jb25maWcuZ2V0KCdpc290b3BlLXVpLmZvbnRGYW1pbHknKSlcblxuICAgIGF0b20uY29uZmlnLm9uRGlkQ2hhbmdlICdpc290b3BlLXVpLmZvbnRXZWlnaHQnLCAtPlxuICAgICAgYXBwbHlGb250V2VpZ2h0KGF0b20uY29uZmlnLmdldCgnaXNvdG9wZS11aS5mb250V2VpZ2h0JykpXG5cbiAgICBhdG9tLmNvbmZpZy5vbkRpZENoYW5nZSAnaXNvdG9wZS11aS5jdXN0b21CYWNrZ3JvdW5kQ29sb3InLCAtPlxuICAgICAgYXBwbHlCYWNrZ3JvdW5kQ29sb3IoKVxuXG4gICAgYXRvbS5jb25maWcub25EaWRDaGFuZ2UgJ2lzb3RvcGUtdWkuY3VzdG9tQmFja2dyb3VuZENvbG9yUGlja2VyJywgLT5cbiAgICAgIGFwcGx5QmFja2dyb3VuZENvbG9yKClcblxuICAgIGF0b20uY29uZmlnLm9uRGlkQ2hhbmdlICdpc290b3BlLXVpLmJhY2tncm91bmRHcmFkaWVudCcsIC0+XG4gICAgICBhcHBseUJhY2tncm91bmRHcmFkaWVudCgpXG5cbiAgICBhdG9tLmNvbmZpZy5vbkRpZENoYW5nZSAnaXNvdG9wZS11aS5iYWNrZ3JvdW5kSW1hZ2UnLCAtPlxuICAgICAgYXBwbHlCYWNrZ3JvdW5kSW1hZ2UoKVxuXG4gICAgYXRvbS5jb25maWcub25EaWRDaGFuZ2UgJ2lzb3RvcGUtdWkuYmFja2dyb3VuZEltYWdlUGF0aCcsIC0+XG4gICAgICBhcHBseUJhY2tncm91bmRJbWFnZSgpXG5cbiAgICBhdG9tLmNvbmZpZy5vbkRpZENoYW5nZSAnaXNvdG9wZS11aS5sb3dDb250cmFzdFRvb2x0aXAnLCAtPlxuICAgICAgYXBwbHlUb29sdGlwQ29udHJhc3QoKVxuXG4gICAgYXRvbS5jb25maWcub25EaWRDaGFuZ2UgJ2lzb3RvcGUtdWkubWF0Y2hFZGl0b3JGb250JywgLT5cbiAgICAgIGFwcGx5RWRpdG9yRm9udCgpXG5cbiAgICBhdG9tLmNvbmZpZy5vbkRpZENoYW5nZSAnaXNvdG9wZS11aS5taW5pbWFsTW9kZScsIC0+XG4gICAgICBhcHBseU1pbmltYWxNb2RlKClcblxuICAgIGF0b20uY29uZmlnLm9uRGlkQ2hhbmdlICdlZGl0b3IuZm9udEZhbWlseScsIC0+XG4gICAgICBhcHBseUVkaXRvckZvbnQoKVxuXG4gICAgYXRvbS5jb25maWcub25EaWRDaGFuZ2UgJ2lzb3RvcGUtdWkudGFiU2l6aW5nJywgLT5cbiAgICAgIGFwcGx5VGFiU2l6aW5nKClcbiJdfQ==
