attribute vec3 position;
attribute vec4 color;
attribute float size;

uniform float pointScale;
uniform vec2 mouse; // マウスカーソルの座標（-1.0 ~ 1.0）

varying vec4 vColor;

void main() {
  vColor = color;

  vec2 toMouse = mouse - position.xy;
  float distanceToMouse = length(toMouse);
  vec2 normalizedToMouse = normalize(toMouse);
  vec2 offset = normalizedToMouse * 0.1 * (1.0 - distanceToMouse);
  vec3 p = vec3(position.xy + offset, position.z);
  gl_Position = vec4(p, 1.0);

  // ベクトルの長さを考慮して頂点のサイズを変化させる
  // gl_PointSize = size * pointScale * distanceToMouse;
	gl_PointSize = size;
}
