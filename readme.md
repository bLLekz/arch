## 1. Разметка диска

> [!TIP]
> Для проверки дисков и их расположения воспользоваться командой `fdisk -l`

Открыть утилиту для разметки диска

```bash
cfdisk /dev/sda
```

Выбрать `GPT` и создать следующие разделы

```
EFI: 512M
SWAP: количество оперативной памяти (например, 4 GB)
Корневая папка: 20-30 GB (оптимально 60 GB при наличии места)
Домашняя папка: оставшееся пространство
```

## 2. Форматирование разделов

Форматирование созданных разделов:

```bash
mkfs.fat -F32 /dev/sda1 # EFI
```

```bash
mkswap /dev/sda2` # SWAP
```

```bash
swapon /dev/sda2` # Включене SWAP
```

```bash
mkfs.ext4 /dev/sda3 # Корневая папка
```

```bash
mkfs.ext4 /dev/sda4 # Домашняя папка (если создана)
```

## 3. Базовая настройка Arch Linux

- Установить базовые пакеты

> [!TIP]
> Перед скачиванем пакетов инициализировать связку ключей для pacman
>
> `pacman-key --init`
>
> `pacman-key --populate`

```bash
pacstrap /mnt base base-devel linux linux-firmware linux-headers sudo nano networkmanager efibootmgr
```

- Генерация fstab

```bash
genfstab -U -p /mnt >> /mnt/etc/fstab
```

- Вход в систему

```bash
arch-chroot /mnt /bin/bash
```

- Добавление языков

```bash
nano /etc/locale.gen
```

Раскомментируйте или добавьте строки:

```
en_US.UTF-8 UTF-8
ru_RU.UTF-8 UTF-8
```

- Генерация локали

```bash
locale-gen
```

- Установка языка системы

```bash
echo "LANG=en_US.UTF-8" > /etc/locale.conf
```

- Установка часового пояса

```bash
ln -sf /usr/share/zoneinfo/Europe/Moscow /etc/localtime
```

- Синхронизация аппаратных часов

```bash
hwclock --systohc --utc
```

- Установка имени компьютера

```bash
echo arch-pc > /etc/hostname
```

- Изменение файла hosts

```bash
nano /etc/hosts
```

Добавить строку в конец файла `127.0.1.1 localhost.localdomain arch-pc`

- Включение сетевого менеджера

```bash
systemctl enable NetworkManager
```

- Создание пользователя

```bash
useradd -m -g users -G wheel -s /bin/bash admin
```

- Создание пароля для пользователя

```bash
passwd admin
```

- Настройка прав sudo

```bash
EDITOR=nano visudo
```

Раскомментируйте строку:
`%wheel ALL=(ALL:ALL) ALL`

- Монтирование EFI раздела

```bash
mkdir /boot/efi
mount /dev/sda1 /boot/efi
```

- Установка GRUB

```bash
pacman -S grub
grub-install --target=x86_64-efi --bootloader-id=GRUB --efi-directory=/boot/efi --removable
```

- Создание конфигруации GRUB

```bash
grub-mkconfig -o /boot/grub/grub.cfg
```

## Дополнительная настройка

- База

```bash
pacman -S fastfetch flatpak git wget firefox
```

- Настройка звука

```bash
pacman -S pulseaudio
```

- Настройка командой оболочки (zsh)
```bash
pacman -S zsh zsh-completions zsh-syntax-highlighting
# Установка по умолчанию ($USERNAME оставить, если нужно установить только текущему пользователю)
chsh -s /usr/bin/zsh $USERNAME
# Плагин для выделения слов
git clone https://github.com/jirutka/zsh-shift-select ~/.local/share/zsh/plugins/zsh-shift-select
# Установка плагина. Добавить строку в  `~/.zshrc`
source ~/.local/share/zsh/plugins/zsh-shift-select/zsh-shift-select.plugin.zsh
```


