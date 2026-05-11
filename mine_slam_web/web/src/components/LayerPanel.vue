<script setup lang="ts">
import type { LayerState } from '../viewer/SceneView';

defineProps<{ layers: LayerState }>();
const emit = defineEmits<{ change: [layers: LayerState] }>();

function update(key: keyof LayerState, value: boolean, layers: LayerState) {
  emit('change', { ...layers, [key]: value });
}

function preset(kind: 'all' | 'none' | 'stable' | 'current' | 'path', layers: LayerState) {
  const reflector = layers.reflector;
  const grid = layers.grid;
  if (kind === 'all') emit('change', { current: true, stable: true, path: true, reflector, grid });
  if (kind === 'none') emit('change', { current: false, stable: false, path: false, reflector, grid });
  if (kind === 'stable') emit('change', { current: false, stable: true, path: false, reflector, grid });
  if (kind === 'current') emit('change', { current: true, stable: false, path: false, reflector, grid });
  if (kind === 'path') emit('change', { current: false, stable: false, path: true, reflector, grid });
}
</script>

<template>
  <section class="panel-section">
    <h2>Layers</h2>
    <div class="button-row layer-preset-row">
      <button type="button" @click="preset('stable', layers)">Stable only</button>
      <button type="button" @click="preset('current', layers)">Current only</button>
      <button type="button" @click="preset('path', layers)">Path only</button>
      <button type="button" @click="preset('none', layers)">All off</button>
      <button type="button" @click="preset('all', layers)">All on</button>
    </div>
    <label class="check-row">
      <input type="checkbox" :checked="layers.current" @change="update('current', ($event.target as HTMLInputElement).checked, layers)" />
      <span>Current cloud</span>
    </label>
    <label class="check-row">
      <input type="checkbox" :checked="layers.stable" @change="update('stable', ($event.target as HTMLInputElement).checked, layers)" />
      <span>Stable map</span>
    </label>
    <label class="check-row">
      <input type="checkbox" :checked="layers.path" @change="update('path', ($event.target as HTMLInputElement).checked, layers)" />
      <span>Path</span>
    </label>
    <label class="check-row">
      <input type="checkbox" :checked="layers.reflector" @change="update('reflector', ($event.target as HTMLInputElement).checked, layers)" />
      <span>Reflector highlight</span>
    </label>
    <label class="check-row">
      <input type="checkbox" :checked="layers.grid" @change="update('grid', ($event.target as HTMLInputElement).checked, layers)" />
      <span>Grid</span>
    </label>
  </section>
</template>
