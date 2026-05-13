<script setup lang="ts">
import { onBeforeUnmount, onMounted, ref, watch } from 'vue';
import ColorModeSelector from './components/ColorModeSelector.vue';
import LayerPanel from './components/LayerPanel.vue';
import StatusPanel from './components/StatusPanel.vue';
import type { ColorMode } from './viewer/ColorMap';
import { BinaryCloudClient } from './viewer/BinaryCloudClient';
import { SceneView, type LayerState, type SceneDebug } from './viewer/SceneView';
import { StatusClient, type ViewerStatus } from './viewer/StatusClient';

const host = window.location.hostname || 'localhost';
const cloudUrl = `ws://${host}:9001/cloud`;
const statusUrl = `ws://${host}:9002/status`;

const sceneEl = ref<HTMLElement | null>(null);
const colorMode = ref<ColorMode>('height');
const layers = ref<LayerState>({ current: true, stable: true, path: true, reflector: true, grid: true });
const cloudConnected = ref(false);
const statusConnected = ref(false);
const status = ref<ViewerStatus | null>(null);
const fps = ref(0);
const frameMs = ref(0);
const sceneDebug = ref<SceneDebug | null>(null);
const menuOpen = ref(false);
const pointSize = ref(0.035);

let scene: SceneView | null = null;
let cloudClient: BinaryCloudClient | null = null;
let statusClient: StatusClient | null = null;

function isTypingTarget(target: EventTarget | null): boolean {
  const element = target as HTMLElement | null;
  if (!element) return false;
  return (
    element.isContentEditable ||
    element.tagName === 'INPUT' ||
    element.tagName === 'SELECT' ||
    element.tagName === 'TEXTAREA'
  );
}

function toggleFullscreen(): void {
  if (document.fullscreenElement) {
    void document.exitFullscreen();
    return;
  }
  void document.documentElement.requestFullscreen?.();
}

function handleKeydown(event: KeyboardEvent): void {
  if (event.code !== 'Space' || isTypingTarget(event.target)) return;
  event.preventDefault();
  toggleFullscreen();
}

onMounted(() => {
  if (!sceneEl.value) return;
  scene = new SceneView(sceneEl.value);
  scene.setLayers(layers.value);
  scene.setColorMode(colorMode.value);
  scene.setPointSize(pointSize.value);
  window.addEventListener('keydown', handleKeydown);
  scene.onStats((stats) => {
    fps.value = stats.fps;
    frameMs.value = stats.frameMs;
    window.__MINE_SLAM_VIEWER_STATS__ = {
      fps: stats.fps,
      frameMs: stats.frameMs,
      currentPoints: status.value?.current_cloud_points ?? 0,
      stablePoints: status.value?.stable_map_points ?? 0,
      pathPoints: status.value?.path.length ?? 0,
      cloudConnected: cloudConnected.value,
      statusConnected: statusConnected.value
    };
    sceneDebug.value = scene?.getDebug() ?? null;
  });

  cloudClient = new BinaryCloudClient(
    cloudUrl,
    (cloud) => scene?.updateCloud(cloud),
    (connected) => {
      cloudConnected.value = connected;
    }
  );
  cloudClient.start();

  statusClient = new StatusClient(
    statusUrl,
    (nextStatus) => {
      status.value = nextStatus;
      scene?.setSourceTopics(nextStatus.current_cloud_source_topic, nextStatus.stable_map_source_topic);
      scene?.updatePath(nextStatus.path, nextStatus.pose);
      sceneDebug.value = scene?.getDebug() ?? null;
    },
    (connected) => {
      statusConnected.value = connected;
    }
  );
  statusClient.start();
});

watch(colorMode, (mode) => scene?.setColorMode(mode));
watch(layers, (nextLayers) => scene?.setLayers(nextLayers), { deep: true });
watch(pointSize, (size) => scene?.setPointSize(size));

onBeforeUnmount(() => {
  window.removeEventListener('keydown', handleKeydown);
  cloudClient?.stop();
  statusClient?.stop();
  scene?.dispose();
});
</script>

<template>
  <main class="app-shell">
    <div ref="sceneEl" class="scene-host"></div>
    <button
      type="button"
      class="menu-toggle"
      :class="{ active: menuOpen }"
      :aria-expanded="menuOpen"
      aria-label="Toggle menu"
      title="Menu"
      @click="menuOpen = !menuOpen"
    >
      <span></span>
      <span></span>
      <span></span>
    </button>
    <aside class="side-panel" :class="{ open: menuOpen }">
      <header class="brand">
        <h1>Mine SLAM Viewer</h1>
        <p>{{ cloudUrl }}</p>
      </header>
      <LayerPanel :layers="layers" @change="layers = $event" />
      <section class="panel-section">
        <h2>Camera</h2>
        <div class="button-row">
          <button type="button" @click="scene?.fitStable()">Fit stable</button>
          <button type="button" @click="scene?.fitCurrent()">Fit current</button>
          <button type="button" @click="scene?.fitAll()">Fit all</button>
        </div>
        <div class="button-row camera-preset-row">
          <button type="button" @click="scene?.viewIso()">Iso</button>
          <button type="button" @click="scene?.viewTop()">Top</button>
          <button type="button" @click="scene?.viewSide()">Side</button>
          <button type="button" @click="scene?.viewEnd()">End</button>
        </div>
      </section>
      <section class="panel-section">
        <h2>Settings</h2>
        <label class="range-row">
          <span>Point size</span>
          <strong>{{ pointSize.toFixed(3) }}</strong>
          <input v-model.number="pointSize" type="range" min="0.005" max="0.12" step="0.005" />
        </label>
      </section>
      <ColorModeSelector :mode="colorMode" @change="colorMode = $event" />
      <StatusPanel
        :cloud-connected="cloudConnected"
        :status-connected="statusConnected"
        :status="status"
        :fps="fps"
        :frame-ms="frameMs"
        :scene-debug="sceneDebug"
      />
    </aside>
  </main>
</template>
