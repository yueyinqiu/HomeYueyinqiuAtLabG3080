read -p "target: " target

echo "BUILD"
home-manager build --flake .#yueyinqiu@lab-g3080

echo "COPY"
nix copy --to "ssh://$target" ./result

echo "ACTIVATE"
ssh "$target" -- HOME_MANAGER_BACKUP_EXT="backup" "$(readlink -f ./result/activate)"

echo "ssh"" ""$target"