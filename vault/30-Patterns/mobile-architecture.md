# Mobile Architecture Standards (React Native & Expo)

## 1. 核心理念与技术栈选型

- **默认使用 Expo**：优先使用 Expo 作为 React Native 的开发框架；如果存在原生能力、构建链或性能约束，再记录例外和选择理由。充分利用 Expo Router 进行基于文件的路由。
- **与 Web 端的代码复用**：
  - 核心业务逻辑（API 请求、数据模型、数据处理函数）必须独立于 UI 层。
  - 适当采用 Monorepo（如 Turborepo）架构，将稳定的业务逻辑、API client 和数据模型抽取为 shared package；UI 和平台能力不强求 100% 复用。
- **UI 组件层隔离**：移动端的 `<View>`、`<Text>` 等原生组件不可与 Web 端的 `<div/>` 混用。针对移动端，应当单独构建一套适配触摸和移动端屏幕的组件（推荐使用 NativeWind 保持与 Web 端一致的 Tailwind 开发体验）。

## 2. 移动端 UI/UX 规范

- **触控区域 (Touch Targets)**：所有可点击元素（按钮、链接）的最小触控区域不得小于 `44x44` pt/dp。
- **安全区域 (Safe Area)**：必须使用 `SafeAreaView` 或 `useSafeAreaInsets`，确保内容不会被异形屏（刘海、药丸、底部 Home 条）遮挡。
- **平台差异化**：
  - 虽然是跨平台开发，但在需要符合系统直觉的地方，应区分 iOS 和 Android（例如：iOS 习惯使用底部 ActionSheet，Android 习惯使用中间弹窗；导航栏切换习惯等）。
- **键盘遮挡处理**：对于所有包含输入框的页面，必须使用 `KeyboardAvoidingView` 或对应的解决方案，确保输入框不被软键盘遮挡。

## 3. 性能优化

- **列表渲染**：不使用 `ScrollView` 承载无界或大规模列表；长列表使用 `FlatList` 或 `FlashList`，并用实际数据量和性能测量决定方案。
- **图片加载**：优先使用 `expo-image`，利用其强大的缓存和占位图（BlurHash）功能，提升弱网环境下的体验。
- **动画实现**：优先使用 `react-native-reanimated` 以实现在 UI 线程直接执行的高性能动画，避免 JS 线程阻塞导致掉帧。

## 4. 网络与数据状态管理

- **离线与弱网**：核心数据根据用户流程和一致性要求考虑本地缓存、重试和离线降级（如使用 `AsyncStorage` 配合 React Query 的 persisted queries）。
- **状态管理**：推荐使用轻量级的 `Zustand` 处理全局客户端状态，使用 `React Query` (SWR) 处理服务端状态缓存与同步。

## 5. 原生模块与权限

- **权限请求**：在调用相机、相册、定位等敏感原生功能前，必须先优雅地请求权限，并在用户拒绝时提供有用的降级方案或引导。
- **推送通知**：默认考虑 Expo Push Notifications；若使用其他供应商，记录平台限制、token 生命周期和失败重试策略。
