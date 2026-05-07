#!/bin/bash
# Script to download assets from Wix portfolio

DEST_DIR="/home/arm-beast/Desktop/anisha-yerramilli.github.io/assets/images/wix"
mkdir -p "$DEST_DIR"

# Base URL for Wix media (without size constraints for highest quality)
BASE_URL="https://static.wixstatic.com/media"

# List of image files to download
IMAGES=(
  # Homepage/Header
  "487b9e_6a4b3154301a4c1da62e483da6d67afc~mv2.png"
  "487b9e_d459634fec804e7a8aedba75bd3ae869~mv2.png"

  # About page - profile photo
  "487b9e_cffc616b16e84096b311beef48887dcd~mv2.jpg"

  # UX Projects
  "487b9e_05ec4b4e63e7426fad75bb1e9f025530~mv2.png"
  "487b9e_18b3783ccee847ff8dd2f10fd86dd0f0~mv2.png"
  "487b9e_7e00dc2b0f4a419fb28dc50a4daf98d9~mv2.jpg"

  # Design Projects
  "487b9e_01c8412d3fd14e9cafc1f3794f0a6155~mv2.png"
  "487b9e_151ee3511c65493fbba17e486de03cde~mv2.png"
  "487b9e_2cf0cfec6f884957ac80ec402a039c8d~mv2.png"
  "487b9e_502411e9f7754f96befc963f6d0f32bf~mv2.png"
  "487b9e_bc501f5768d04b0da9bfa86782fd0942~mv2.png"
  "487b9e_d98e95a182b643699356b4698460c5b3~mv2.png"
  "487b9e_e98b3160460a4e1fa221caad7b77d64e~mv2.png"
  "487b9e_ef0163b00edb4b3db804b6398936737f~mv2.png"

  # Logo Designs
  "487b9e_05557b25477f407ebcff0d38d2cbdc20~mv2.jpg"
  "487b9e_2341054b535844b483a82e1a0982f6f4~mv2.png"
  "487b9e_d842bfce6402447d99dca56f567a210b~mv2.png"

  # Graphic Design
  "487b9e_2ad76a0fa79f42789e6900107302cee2~mv2.png"
  "487b9e_63321df3e33344fd9316c541b4c5e40c~mv2.png"

  # 3D Art
  "487b9e_1e1cdc5c7aef4d41910bf00dd12a909c~mv2.jpg"
  "487b9e_233eca41ff4d42ea8acdcb3e2c83d612~mv2.jpg"
  "487b9e_4a3d75f16ccf482298d66c6d4aeb0d1ef000.jpg"
  "487b9e_726ca7a0d8b541fea630f4651bfdacd5f000.jpg"
  "487b9e_97743fed25ce468ea8a3c6187bcb61d9~mv2.jpg"
  "487b9e_adead25cb7f047c0b7798a24d5198a73~mv2.jpg"

  # ITW Project
  "487b9e_01b2ed1b0b4d4ea3978c799dffa11cfb~mv2.png"
  "487b9e_04da216c65974201b8e1b7c52d799fc4~mv2.png"
  "487b9e_18e21e2c57b340e78b7e63c4d49c0113~mv2.jpg"
  "487b9e_2a0d520298d4435fa400cac26173aa97~mv2.png"
  "487b9e_6182c356132e4bc19aaca022940fee0c~mv2.png"
  "487b9e_656f90aa765a453eb1739e43da458dcf~mv2.png"
  "487b9e_7ede288a4bc741b5bfc781d411587065~mv2.png"
  "487b9e_8147b1c65897466f87a5643380f34673~mv2.jpg"
  "487b9e_9c112839151b488a8ee8ba6997d0f61c~mv2.png"
  "487b9e_a249bd99791446a79bef77b38126c484~mv2.jpg"
  "487b9e_b8d77ea98e3e4ef4958ec2a53bee6276~mv2.png"
  "487b9e_d22c64947f224e92975f07784149c918~mv2.png"
  "487b9e_d556cf04e56a4665926c59bb64812c22~mv2.png"
  "487b9e_e9166f9430d74fe4902d5c16a2c847ff~mv2.png"
  "487b9e_fc70250f2b924fdfa9d5d7d52163f3f2~mv2.png"

  # Malala Fund Project
  "487b9e_10fb952abc7b4a82b9c403f490881cbf~mv2.png"
  "487b9e_26bbd88f57794bbba9223ac5bddd3b41~mv2.png"
  "487b9e_28e43f51ac5f4a07b31a421856038ffb~mv2.png"
  "487b9e_2e4f82d03c2442e5803c8d957738a5f2~mv2.png"
  "487b9e_3a1c9aba31e9437d94de780bf36dafbd~mv2.jpg"
  "487b9e_6e196f53c86742f0ab43d9719b4b36f8~mv2.png"
  "487b9e_86b5127375f84fd99c91aefc51d1e4f8~mv2.png"
  "487b9e_96e521b07653439a89d72094be94cf54~mv2.png"
  "487b9e_9f69b174f76d4177bf666b9831e46659~mv2.png"
  "487b9e_a2ebc3ffa4ea41fbb32d09e52f92eb31~mv2.png"
  "487b9e_ad11ff33f46b4e42a136591318400bbc~mv2.png"
  "487b9e_aeb8098f979f43288729da4c7e5507b7~mv2.png"
  "487b9e_c4e1ce1c08f3419d8808c1975d168c81~mv2.png"
  "487b9e_d8b62d97b6b546d7b3c44bfd02ffe633~mv2.png"
  "487b9e_e151c0c1fcc243b5a2c41066869d0b4e~mv2.png"

  # JoinIn Project
  "487b9e_0152a7fddbe7408e9d2de0864e238385~mv2.png"
  "487b9e_07536ff892484907ba6f4101e6bf73b9~mv2.png"
  "487b9e_0d598818919d4b5e8343d4ea8967875d~mv2.png"
  "487b9e_172bb185693c4fcea9968eab68b3a811~mv2.png"
  "487b9e_1d7e873ef12e47aaad834647623dc051~mv2.png"
  "487b9e_1fa640f94bc5490aa038a4e676ecfb57~mv2.png"
  "487b9e_2e1693ec104d4d39afd27c08ff6870c9~mv2.png"
  "487b9e_2ec5265cb00d4c6fb187a190f9eccbe0~mv2.png"
  "487b9e_319d55a2b1194efcbeeebecc823bf0cd~mv2.png"
  "487b9e_6168e5ba6ad14d06b21dc662d315a2ee~mv2.png"
  "487b9e_6f50bfd009b9438f8f692252aa800127~mv2.png"
  "487b9e_6ff9ccb680584d21a86a8a96b6a0e169~mv2.png"
  "487b9e_79d943ab5d9e45e2bd2efe81fd6cd805~mv2.png"
  "487b9e_9198e83abe734acda92c9f4a7a9b963c~mv2.png"
  "487b9e_a8e151a389284d14bdf9d943019592df~mv2.png"
  "487b9e_b0d9b1c6dbe045e1b0af8485718488bb~mv2.png"
  "487b9e_b388652326a0419a8020f754c4ea1609~mv2.png"
  "487b9e_b5b3e0097a7e46dbb06abb074c6a5a5a~mv2.png"
  "487b9e_b6367457ff5c43748c153d94688597db~mv2.png"
  "487b9e_b872db3a33384b91aef684136ce8dcce~mv2.png"
  "487b9e_c7373c04f6024a09986f7ce0684178a6~mv2.png"
  "487b9e_ccf987ea6e8e4bb5b56da72f78657273~mv2.png"
  "487b9e_d704c86184d248ed9cd2709560279f51~mv2.png"
  "487b9e_f1fccc2472e847cb97701aaaae6c5985~mv2.png"
  "487b9e_f5d8a11035b84e2abe92f3b3ee98f8a4~mv2.png"
  "487b9e_fc06737275414218998157da2c0fb1fe~mv2.png"
)

echo "Downloading ${#IMAGES[@]} images from Wix..."

count=0
failed=0
for img in "${IMAGES[@]}"; do
  count=$((count + 1))
  output_file="$DEST_DIR/$img"

  if [ -f "$output_file" ]; then
    echo "[$count/${#IMAGES[@]}] Skipping $img (already exists)"
    continue
  fi

  echo "[$count/${#IMAGES[@]}] Downloading $img..."

  # Try downloading without size parameters first (original quality)
  if curl -s -f -o "$output_file" "$BASE_URL/$img" 2>/dev/null; then
    echo "  -> Success"
  else
    # If that fails, try with a large size parameter
    if curl -s -f -o "$output_file" "$BASE_URL/$img/v1/fill/w_1920,h_1920,al_c,q_90" 2>/dev/null; then
      echo "  -> Success (with size param)"
    else
      echo "  -> FAILED"
      failed=$((failed + 1))
    fi
  fi
done

echo ""
echo "Download complete!"
echo "Total: ${#IMAGES[@]}, Failed: $failed"
echo "Images saved to: $DEST_DIR"
