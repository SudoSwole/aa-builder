'use babel';

Object.defineProperty(exports, '__esModule', {
  value: true
});
var isFunction = function isFunction(value) {
  return isType(value, 'function');
};

var isString = function isString(value) {
  return isType(value, 'string');
};

var isType = function isType(value, typeName) {
  var t = typeof value;
  if (t == null) {
    return false;
  }
  return t === typeName;
};

exports.isFunction = isFunction;
exports.isString = isString;
//# sourceMappingURL=data:application/json;charset=utf-8;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbIi9idWlsZC9hdG9tL3NyYy9hdG9tLTEuNjEuMC1iZXRhMC9vdXQvYXBwL25vZGVfbW9kdWxlcy9hdXRvY29tcGxldGUtcGx1cy9saWIvdHlwZS1oZWxwZXJzLmpzIl0sIm5hbWVzIjpbXSwibWFwcGluZ3MiOiJBQUFBLFdBQVcsQ0FBQTs7QUFFWCxNQUFNLENBQUMsY0FBYyxDQUFDLE9BQU8sRUFBRSxZQUFZLEVBQUU7QUFDM0MsT0FBSyxFQUFFLElBQUk7Q0FDWixDQUFDLENBQUM7QUFGSCxJQUFNLFVBQVUsR0FBRyxTQUFiLFVBQVUsQ0FBRyxLQUFLLEVBQUE7QUFJdEIsU0FKMEIsTUFBTSxDQUFDLEtBQUssRUFBRSxVQUFVLENBQUMsQ0FBQTtDQUFBLENBQUE7O0FBRXJELElBQU0sUUFBUSxHQUFHLFNBQVgsUUFBUSxDQUFHLEtBQUssRUFBQTtBQU1wQixTQU53QixNQUFNLENBQUMsS0FBSyxFQUFFLFFBQVEsQ0FBQyxDQUFBO0NBQUEsQ0FBQTs7QUFFakQsSUFBTSxNQUFNLEdBQUcsU0FBVCxNQUFNLENBQUksS0FBSyxFQUFFLFFBQVEsRUFBSztBQUNsQyxNQUFNLENBQUMsR0FBRyxPQUFPLEtBQUssQ0FBQTtBQUN0QixNQUFJLENBQUMsSUFBSSxJQUFJLEVBQUU7QUFBRSxXQUFPLEtBQUssQ0FBQTtHQUFFO0FBQy9CLFNBQU8sQ0FBQyxLQUFLLFFBQVEsQ0FBQTtDQUN0QixDQUFBOztBQVdELE9BQU8sQ0FURSxVQUFVLEdBQVYsVUFBVSxDQUFBO0FBVW5CLE9BQU8sQ0FWYyxRQUFRLEdBQVIsUUFBUSxDQUFBIiwiZmlsZSI6Ii9idWlsZC9hdG9tL3NyYy9hdG9tLTEuNjEuMC1iZXRhMC9vdXQvYXBwL25vZGVfbW9kdWxlcy9hdXRvY29tcGxldGUtcGx1cy9saWIvdHlwZS1oZWxwZXJzLmpzIiwic291cmNlc0NvbnRlbnQiOlsiJ3VzZSBiYWJlbCdcblxuY29uc3QgaXNGdW5jdGlvbiA9IHZhbHVlID0+IGlzVHlwZSh2YWx1ZSwgJ2Z1bmN0aW9uJylcblxuY29uc3QgaXNTdHJpbmcgPSB2YWx1ZSA9PiBpc1R5cGUodmFsdWUsICdzdHJpbmcnKVxuXG5jb25zdCBpc1R5cGUgPSAodmFsdWUsIHR5cGVOYW1lKSA9PiB7XG4gIGNvbnN0IHQgPSB0eXBlb2YgdmFsdWVcbiAgaWYgKHQgPT0gbnVsbCkgeyByZXR1cm4gZmFsc2UgfVxuICByZXR1cm4gdCA9PT0gdHlwZU5hbWVcbn1cblxuZXhwb3J0IHsgaXNGdW5jdGlvbiwgaXNTdHJpbmcgfVxuIl19